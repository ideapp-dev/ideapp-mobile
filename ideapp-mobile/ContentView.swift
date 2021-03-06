//
//  ContentView.swift
//  ideapp-mobile
//
//  Created by Cenk Gokturk on 3.02.2022.
//

import SwiftUI
import BCryptSwift

import Foundation
import Combine

//MARK: - Empty page

struct EmptyView: View {
    var body: some View {
        Text("Empty")
    }
}

//MARK: - Objects

var name:String = ""
var sirname:String = ""
var email:String = ""
var studentId:String = ""
var password:String = ""

var userId: String = ""

var studentEvents: [SingleEvent] = []
var studentExam: [SingleExam] = []

var studentLessons: [SingleLesson] = []
var studentLessonNames: [String] = []
var dayNumber: Int = 6
var hourNumber: Int = 2

var lessonIdName: [String:String] = [:]
var allLessonIdNames: [String:String] = [:]


var type = 1


var timeEnum2 = [1:"08:30-10:20",
                2:"10:30-12:20",
                3:"12:30-14:20",
                4:"14:30-16:20",
                5:"16:30-18:20",
                6:"18:30-20:20"]


var timeEnum = [1:"08:00-10:00",
                2:"10:00-12:00",
                3:"12:00-14:00",
                4:"14:00-16:00",
                5:"16:00-18:00",
                6:"18:00-20:00"]


struct ContentView: View {
    
    // Variables
    @State var showLogin = true
    @State var showHomeScreen = false
    @State var manager = DataPost()
    
    func checkTime(){
        // Dates necessary for events
        let date = Date()
        let format = DateFormatter()
        format.locale = Locale(identifier: "us")
        format.dateFormat = "E"
        
        var dateNumbers: [String:Int] = ["Mon":1, "Tue":2, "Wed":3, "Thu":4, "Fri":5, "Sat":6, "Sun":7]
        let formattedDate = format.string(from: date)

        if let val = dateNumbers[formattedDate] {
            dayNumber = dateNumbers[formattedDate]!
        }
        
        format.dateFormat = "HH"
        let hourString = format.string(from: Date())
        
        if hourString == "08" || hourString == "09"{
            hourNumber = 1
        }else if hourString == "10" || hourString == "11"{
            hourNumber = 2
        }else if hourString == "12" || hourString == "13"{
            hourNumber = 3
        }else if hourString == "14" || hourString == "15"{
            hourNumber = 4
        }else if hourString == "16" || hourString == "17"{
            hourNumber = 5
        }else if hourString == "18" || hourString == "19"{
            hourNumber = 6
        }
    }
    
    func checkEvents(){
        //checkTime()
        manager.retrieveEvents()
        
        if manager.retrieveEventDone {
            for item in studentEvents {
                print("1. \(item.time) | current time \(dayNumber):\(hourNumber)")
                for i in 1...dayNumber {
                    if item.time["\(i)"] != nil {
                        if item.time["\(i)"]! < hourNumber {
                            var itemHour: Int = item.time["\(i)"]!
                            var itemDay: Int = i+1
                            var newTime: [String:Int] = ["\(itemDay)":itemHour]
                            
                            //print("ContentViewEvents - studentEvents \(studentEvents)")
                            
                            studentEvents = studentEvents.filter { $0.id != item.id }
                            studentEvents.append(SingleEvent(id: item.id, name: item.name, time: newTime))
                        }
                    }
                }
            }
        }
    }
    
    func checkLessons(){
        if manager.retrieveStudentLessonName {
            var takenLessonsCount: Int = studentLessonNames.count
            var currentIndex: Int = 1
            
            for lesson in studentLessonNames{
                //print("Lesson \(lesson)")
                var lessonName: String = lesson as! String
                //print("Adding lesson \(lessonName)")
                manager.retrieveStudentLessonDone = false
                manager.retrieveLessonDetails(name: lessonName)
            }
        }
        
        
        if manager.retrieveStudentLessonDetails{
            for lesson in studentLessons{
                //print("Full Lesson Details \(lesson)")
            }
        }
    }
    
    init()??{
        
        // Delete the following after testing
        // test1@etu.edu.tr
        // yi??ittest@etu.edu.tr
        
        /*
        UserDefaults.standard.set(true, forKey: "Token")
        UserDefaults.standard.set(1, forKey: "Type")
        UserDefaults.standard.set("yigittest@etu.edu.tr", forKey: "Email")
        */
        
    
        
        var isAuthorized: Bool = UserDefaults.standard.bool(forKey: "Token")
        type = UserDefaults.standard.integer(forKey: "Type")
            
        if isAuthorized == true {
            var userMail: String = UserDefaults.standard.string(forKey: "Email")!

            _showLogin = State(initialValue: false) // normalle false
            _showHomeScreen = State(initialValue: true)
            
            
            var userType: Int = UserDefaults.standard.integer(forKey: "Type")
            
            if (userType == 1){
                print("Instructor")
                manager.retrieveStudentLessons(mail: userMail, type: "Instructor")
                manager.profileInfo(collection: "Instructor")
                // manager.retrieveExamDetails(mail: userMail, type: "Instructor")
            }else{
                print("Student")
                manager.retrieveStudentLessons(mail: userMail, type: "students")
                manager.profileInfo(collection: "students")
                //manager.retrieveExamDetails(mail: userMail, type: "students")
            }
            
            manager.retrieveAllLessons()
            checkLessons()
            checkEvents()
        }
    }
    

    //@State var showCreateLesson = false
    var body: some View {
        
        //return CreateLesson(showCreateLesson: $showCreateLesson)
        
         return Group {

             if showLogin == true && showHomeScreen == false {
                 Login(showLogin: $showLogin, showHomeScreen: $showHomeScreen)
             }
             else if showLogin == false && showHomeScreen == false{
                 Register(showLogin: $showLogin, showHomeScreen: $showHomeScreen)
             }else{
                 HomeScreen(showHomeScreen: $showHomeScreen)
             }
         }
    }
}

//MARK: - DB Operations
class DataPost: ObservableObject {
    var didChange = PassthroughSubject<DataPost, Never>()
    var formCompleted = false {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var receivedResponse: [String: Any] = [:]
    
    // Boolean values to show if the db operation (such as reading or writing) is finished
    var done = false
    var isAuthorized: Bool = false
    
    var createEventDone: Bool = false
    var newId: String = ""
    
    var loginDone = false
    var retrieveEventDone: Bool = false
    
    var retrieveStudentLessonName: Bool = false
    var retrieveStudentLessonDone: Bool = false
    var retrieveStudentLessonDetails: Bool = false
    var retrieveStudentExamDetails: Bool = false
    
    var retrieveExamDetailsControl: Bool = false
    
    var profileInfoDone = false
    
    func profileInfo(collection: String){
        
        let body: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": UserDefaults.standard.string(forKey: "Email")! ] ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var receivedHASHDone = ""
        
        //print("-----> body: \(body)")
        //print("-----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/findOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("profileInfo-----> data: \(data)")
            //print("profileInfo-----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("profileInfo-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("profileInfo-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                
                var receivedJSON = responseJSON["document"] as! [String:Any]
                var receivedHASH: String = receivedJSON["password"] as! String
                
                userId = receivedJSON["_id"] as! String
                // control mechanism to check collection type
                if (collection == "students") {
                    name = receivedJSON["name"] as! String
                    sirname = receivedJSON["sirname"] as! String
                    // var tempID = receivedJSON["student_id"] as! String
                    
                    
                    
                    var tempString: String = ""
                    
                    if receivedJSON["student_id"] is String {
                        tempString = receivedJSON["student_id"] as! String
                    }else if receivedJSON["student_id"] is Int {
                        var tempID: Int = receivedJSON["student_id"] as! Int
                        tempString = "\(tempID)"
                    }
                    
                    //print("profileInfo -> \(tempString)")

                    studentId = tempString
                }else if (collection == "Instructor") {
                    name = receivedJSON["name"] as! String
                    sirname = receivedJSON["sirname"] as! String

                    
                    var tempString: String = ""
                    
                }
                // rest of columns
             
                self.profileInfoDone = true
            }
            
        }
        
        task.resume()
        
        // Necessary for the program to wait until the whole request is received
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !profileInfoDone
        
    }
    
    // Write the given dictionary to the db
    func createLesson(lesson: NSDictionary){
        print("Creating lesson")
        
        let body: [String: Any] = ["collection": "Lesson",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "document": lesson ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        //print("createLesson body \(body)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/insertOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("createLesson-----> data: \(data)")
            //print("createLesson-----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("createLesson-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("createLesson-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                var currentResponse: [String:String] = responseJSON as! [String:String]
                var createdId: String = currentResponse["insertedId"] as! String
                
                self.addLessonInstructor(lesson: createdId)
                
                self.done = true
            }
            
        }
        
        task.resume()
    }
    
    func createEvent(event: NSDictionary){
        
        let body: [String: Any] = ["collection": "Event",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "document": event ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/insertOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("-----> data: \(data)")
            //print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("-----2> responseJSON: \(responseJSON)")
                
                self.newId = responseJSON["insertedId"] as! String
                
                self.receivedResponse = responseJSON
                self.createEventDone = true
            }
            
        }
        
        task.resume()
    }
    
    // Add the user to the db
    func signup(user: NSDictionary, collection: String){
        
        print("Sending collection \(collection) ")
        print("Sending user \(user) ")
        
        let dict_send: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "document": user ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dict_send)
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/insertOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("-----> data: \(data)")
            //print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                self.done = true
            }
            
        }
        
        task.resume()
    }
    
    func addLessonInstructor(lesson: String){
        

        let dict_send: [String: Any] = ["collection": "students",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                    "filter": ["email": UserDefaults.standard.string(forKey: "Email")! ],
                                        "update": ["$push": ["lessons_given": ["$oid":lesson] ]]
                                    ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dict_send)
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/updateOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("enrollToLesson -----> data: \(data)")
            //print("enrollToLesson -----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("enrollToLesson -----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                self.done = true
            }
            
        }
        
        task.resume()
    }
    
    // Add the user to the db
    func enrollToLesson(lesson: String){
        

        let dict_send: [String: Any] = ["collection": "students",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                    "filter": ["email": UserDefaults.standard.string(forKey: "Email")! ],
                                        "update": ["$push": ["lessons_taken": ["$oid":lesson] ]]
                                    ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dict_send)
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/updateOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("enrollToLesson -----> data: \(data)")
            //print("enrollToLesson -----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("enrollToLesson -----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                self.done = true
            }
            
        }
        
        task.resume()
    }
    
    var errorMessageMail: String = ""
    var errorMessagePassword: String = ""
    
    // Login the user depending on the inputs given
    func login(user: NSDictionary, collection: String) -> Bool{
        
        if collection == "Instructor" {
            type = 1
        }else{
            type = 0
        }
        
        let body: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": user["email"] ] ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var receivedHASHDone = ""
        
        //print("login -----> user: \(user)")
        //print("login -----> body: \(body)")
        //print("login -----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/findOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("login -----> data: \(data)")
            //print("login -----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                //print("login -----> httpResponse.statusCode \(httpResponse.statusCode)")
                var httpCode = httpResponse.statusCode
                
                if httpCode == 400 || httpCode == 401 ||??httpCode == 404 {
                    
                    self.errorMessageMail = "mail you entered wasn't found"
                    
                    self.isAuthorized = false
                    self.loginDone = true
                    
                    return
                }
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])

            
            //print("login -----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("login -----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                if let receivedJSON = responseJSON["document"] as? [String:Any]{
                    //var receivedJSON = responseJSON["document"] as! [String:Any]
                    var receivedHASH: String = receivedJSON["password"] as! String
                    
                    receivedHASHDone = receivedHASH
                    
                    var givenPassword: String = user["password"] as! String
                    
                    //print("givenPassword \(givenPassword) & receivedHASH \(receivedHASH)")
                
                    
                    if let tempAuthValue = BCryptSwift.verifyPassword(givenPassword, matchesHash: receivedHASH){
                        self.isAuthorized = tempAuthValue
                        
                        if tempAuthValue == false{
                            self.errorMessagePassword = "Wrong password"
                            //print("login -----> errorMessagePassword \(self.errorMessagePassword)")
                        }
                        
                        self.loginDone = true
                    }else{
                        self.errorMessagePassword = "Wrong password"
                        //print("login -----> errorMessageMail \(self.errorMessagePassword)")
                        
                        self.isAuthorized = false
                        self.loginDone = true
                    }
                    
                    //print("isAuthorized function \(self.isAuthorized)")
                }else{
                    //print("login -----> receivedJSON is null")
                    self.errorMessageMail = "mail you entered wasn't found"
                    //print("login -----> errorMessageMail \(self.errorMessageMail)")
                    
                    self.isAuthorized = false
                    self.loginDone = true
                    
                }
            
                
            }
            
        }
        
        task.resume()
        
        // Necessary for the program to wait until the whole request is received
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !loginDone

        
        //print("return isAuthorized function \(self.isAuthorized)")
        
        /*
        repeat{
            
        } while receivedHASHDone == ""
        */
        
        return isAuthorized
    }
    
    // Retrieve the list of events
    func retrieveEvents(){
        
        let body: [String: Any] = ["collection": "Event",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["owner": UserDefaults.standard.string(forKey: "Email")! ]
                                ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        
        
        //print("-----> body: \(body)")
        //print("-----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/find")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("-----> data: \(data)")
            //print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("-----1> retrieveEVents responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("-----2> retrieveEVents responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                
                var receivedJSON = responseJSON["documents"] as! [[String:Any]]
                
                for item in receivedJSON{
                    
                    print(" -> event \(item)")
                    
                    var eventName: String = item["name"] as! String
                    var eventId: String = item["_id"] as! String
                    
                    print(" -> name \(eventName)")
                    
                    var eventTime: [String:NSNumber] = item["time"] as! [String:NSNumber]
                    
                    var day:Int = 0
                    var hour:Int = 0
                    
                    var time: [String:Int] = [:]
                    
                    for (key, value) in eventTime {
                        //print("key: \(key) & value: \(value)")
                        
                        day = (key as NSString).integerValue
                        hour = value.intValue

                        time["\(day)"] = hour
                    }
                    
                    studentEvents.append(SingleEvent(id: eventId,name: eventName, time: time))
    
                }
                
                //print("studentEvents.count \(studentEvents.count)")
                //print("eventTime.count \(receivedJSON.count)")
                if studentEvents.count == receivedJSON.count {
                    self.retrieveEventDone = true
                }
                
                //print("retrieveEvents \(receivedJSON)")
                //print("studentEvents \(studentEvents)")
                
                
                
            }
            
        }
        
        task.resume()
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !retrieveEventDone

    }
    
        
    
    func retrieveStudentLessons(mail:String, type:String){
        
        //print("retrieveStudentLessons - \(mail) \(type)")
        
        let body: [String: Any] = ["collection": type,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": mail ]
                                ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
        //print("retrieveStudentLessons -----> body: \(body)")
        //print("retrieveStudentLessons -----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/findOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("retrieveStudentLessons -----> data: \(data)")
            //print("retrieveStudentLessons -----> error: \(error)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("retrieveStudentLessons -----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                //print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                
                //print("retrieveStudentLessons - receivedResponse \(self.receivedResponse)")
                
                var receivedJSON = responseJSON["document"] as! [String:Any]
                
                var jsonColumn = "taken_lessons"
                if type == "Instructor" {
                    jsonColumn = "lessons_given"
                }else{
                    if receivedJSON.keys.contains("lessons_taken"){
                        jsonColumn = "lessons_taken"
                    }
                    
                    if receivedJSON.keys.contains("exams"){
                        //print("!!!!Exams \(receivedJSON["exams"])")
                        var examsTaken: NSArray = receivedJSON["exams"] as! NSArray
                        //print("!!!!examsTaken \(examsTaken)")
                        
                        for exam in examsTaken{
                            var item: [String: Any] = exam as! [String: Any]
                            
                            var answers:??[String] = item["answers"] as! [String]
                            var scores:??[Any] = item["score"] as! [Any]
                            var scoresNew: [String] = []
                            
                            for object in scores {
                                if object is NSNull {
                                    scoresNew.append("not answered")
                                } else {
                                    scoresNew.append(object as! String)
                                }
                            }
                            
                            var id: String = item["exam_id"] as! String
                            
  
                
                            
                            var paramsToSend: [String:Any] = ["answers": answers, "scores":scores, "id":id]
                            
                            let json: [String: Any] = ["collection": "Exam",
                                                       "database": "ideapp",
                                                       "dataSource": "ProjectCluster",
                                                       "filter": ["_id": ["$oid":id] ]
                                                    ]

                                    let jsonData = try? JSONSerialization.data(withJSONObject: json)

                                    // create post request
                                    let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/findOne")!
                                    var request = URLRequest(url: url)
                                    request.httpMethod = "POST"
                                    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
                                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                    request.setValue("application/json", forHTTPHeaderField: "Accept")
                                    request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
                                    request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")

                                    // insert json data to the request
                                    request.httpBody = jsonData

                                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                                        guard let data = data, error == nil else {
                                            //print(error?.localizedDescription ?? "No data")
                                            self.retrieveStudentExamDetails = true
                                            return
                                        }
                                        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                                        if let responseJSON = responseJSON as? [String: Any] {
                                            self.receivedResponse = responseJSON
                                            self.retrieveStudentExamDetails = true
                                            
                                            var receivedJSON = responseJSON["document"] as! [String:Any]
                                            
                                            var lesson_id = receivedJSON["lesson_id"] as! String
                                            var questions = receivedJSON["questions"] as! [String]
                                            var end_time = receivedJSON["end_time"] as! String
                                            var start_time = receivedJSON["start_time"] as! String
                                            var name = receivedJSON["name"] as! String
                                            
                                            
                                            studentExam.append(SingleExam(id: name, lesson_id: lesson_id, questions: questions, answers: answers, score: scoresNew, name: name, start_time: start_time, end_time: end_time))
                                            
                                            //print("!!!!answers \(answers)")
                                            //print("!!!!scores \(scoresNew)")
                                            //print("!!!!id \(id)")
                                            //print("StudentExam is \(studentExam)")
                                            
                                        }
                                    }

                                    task.resume()
                            

                        }
                    }
                }
                
                var takenLessons: [String] = receivedJSON[jsonColumn] as!??[String]
                
                var takenLessonsCount: Int = takenLessons.count
                var currentlyAdded: Int = 1
                
                for lesson in takenLessons{
                    //print("Adding lesson name \(lesson) to studentLessonNames")
                    studentLessonNames.append(lesson)
                    currentlyAdded += 1
                }
                
                if currentlyAdded >= takenLessonsCount {
                    self.retrieveStudentLessonName = true
                }
                
            }
            
        }
        
        task.resume()
        
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !retrieveStudentLessonName

    }

    
    func retrieveAllLessons(){
        
        let json: [String: Any] = ["collection": "Lesson",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster"
                                ]

                let jsonData = try? JSONSerialization.data(withJSONObject: json)

                // create post request
                let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/find")!
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
                request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")

                // insert json data to the request
                request.httpBody = jsonData
        
                //print("retrieveAllLessons")

                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {
                        //print(error?.localizedDescription ?? "No data")
                        self.retrieveStudentExamDetails = true
                        return
                    }
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                    //print("retrieveAllLessons -> responseJSON \(responseJSON)")
                    if let responseJSON = responseJSON as? [String: Any] {
                        
                        self.receivedResponse = responseJSON
                        
                        var receivedJSON = responseJSON["documents"] as! [[String:Any]]
                        
                        for item in receivedJSON{
                            //print("retrieveAllLessons -> item \(item)")
                            
                            var lesson_id = item["_id"] as! String
                            var name = item["name"] as! String
                            var credit = item["credit"] as! Int
                            var faculty = item["faculty"] as! String
                            var semester = item["semester"] as! String
                            var instructor = item["instructor"] as! String
                            //var time: [Int:Int] = receivedJSON["time"] as! [Int:Int]
                            //var code: String = item["code"] as! String
                            //var description: String = item["description"] as! String
                            

                            allLessonIdNames[lesson_id] = name
                            //print("retrieveAllLessons -> allLessonIdNames \(allLessonIdNames)")
                        }
                    }
                }

                task.resume()
        /*
        let body: [String: Any] = ["collection": "Lesson",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster"
                                ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        
        
        //print("retrieveLessonDetails -----> body: \(body)")
        //print("retrieveLessonDetails -----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/findOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("retrieveLessonDetails -----> data: \(data)")
            //print("retrieveLessonDetails -----> error: \(error)")
            //print("retrieveLessonDetails -----> response: \(response)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            guard let response = response else{
                self.retrieveStudentLessonDetails = true
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                //print("retrieveLessonDetails -----> httpResponse.statusCode \(httpResponse.statusCode)")
                var httpCode = httpResponse.statusCode
                
                if httpCode == 400 || httpCode == 401 ||??httpCode == 404 {
                    self.retrieveStudentLessonDetails = true
                    return
                }
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("retrieveLessonDetails -----1> responseJSON: \(responseJSON)")
            
            if self.receivedResponse != nil {
                if let responseJSON = responseJSON as? [String: Any] {
                    //print("retrieveLessonDetails -----2> responseJSON: \(responseJSON)")
                    self.receivedResponse = responseJSON
                    
                    
                    //print("receivedResponse \(self.receivedResponse)")
                    
                    var receivedJSON = responseJSON["document"] as! [String:Any]
                    
                    var lessonId = receivedJSON["_id"] as! String
                    var lessonName = receivedJSON["name"] as! String
                    var lessonCredit = receivedJSON["credit"] as! Int
                    var lessonFaculty = receivedJSON["faculty"] as! String
                    var lessonSemester = receivedJSON["semester"] as! String
                    var lessonInstructor = receivedJSON["instructor"] as! String
                    var eventTime: [String:NSNumber] = receivedJSON["time"] as! [String:NSNumber]
                    
                    var day:Int = 0
                    var time:Int = 0
                    
                    var dayTime: [Int: Int] = [:]
                    
                    //print("Adding lesson with name \(lessonName)")
                    
                    for (key, value) in eventTime {
                        //print("key: \(key) & value: \(value)")
                        
                        day = (key as NSString).integerValue
                        time = value.intValue
                        dayTime[day] = time
                    }
                    
                    lessonIdName[lessonId] = lessonName
                    
                    studentLessons.append(SingleLesson(id: lessonId, name: lessonName, credit: lessonCredit, faculty: lessonFaculty, semester: lessonSemester, instructor: lessonInstructor, time: dayTime))
                    self.retrieveStudentLessonDetails = true
                }
            }else{
                self.retrieveStudentLessonDetails = true
            }
        }
        
        task.resume()
        
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !retrieveStudentLessonDetails
        
        */

    }
    
    func retrieveLessonDetails(name:String){
        
        let body: [String: Any] = ["collection": "Lesson",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   //"filter": ["code": name ]
                                   "filter": ["_id": ["$oid":name] ]
                                ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        
        
        //print("retrieveLessonDetails -----> body: \(body)")
        //print("retrieveLessonDetails -----> jsonData: \(jsonData)")
        
        let url = URL(string: "https://data.mongodb-api.com/app/data-rbevh/endpoint/data/beta/action/findOne")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
        request.setValue("051yNXhgBv65BsCe530TOZdKGMcglM2TSWGrf70nAIpXGzConysHbv7Mo6I38FdH", forHTTPHeaderField: "api-key")
        request.httpBody = jsonData
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //print("retrieveLessonDetails -----> data: \(data)")
            //print("retrieveLessonDetails -----> error: \(error)")
            //print("retrieveLessonDetails -----> response: \(response)")
            
            guard let data = data, error == nil else {
                //print(error?.localizedDescription ?? "No data")
                return
            }
            
            guard let response = response else{
                self.retrieveStudentLessonDetails = true
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                //print("retrieveLessonDetails -----> httpResponse.statusCode \(httpResponse.statusCode)")
                var httpCode = httpResponse.statusCode
                
                if httpCode == 400 || httpCode == 401 ||??httpCode == 404 {
                    self.retrieveStudentLessonDetails = true
                    return
                }
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //print("retrieveLessonDetails -----1> responseJSON: \(responseJSON)")
            
            if self.receivedResponse != nil {
                if let responseJSON = responseJSON as? [String: Any] {
                    //print("retrieveLessonDetails -----2> responseJSON: \(responseJSON)")
                    self.receivedResponse = responseJSON
                    
                    
                    //print("receivedResponse \(self.receivedResponse)")
                    
                    var receivedJSON = responseJSON["document"] as! [String:Any]
                    
                    var lessonId = receivedJSON["_id"] as! String
                    var lessonName = receivedJSON["name"] as! String
                    var lessonCredit = receivedJSON["credit"] as! Int
                    var lessonFaculty = receivedJSON["faculty"] as! String
                    var lessonSemester = receivedJSON["semester"] as! String
                    var lessonInstructor = receivedJSON["instructor"] as! String
                    
                   
                    var dayTime: [Int: Int] = [:]
                    if receivedJSON.keys.contains("time"){
                        var eventTime: [String:NSNumber] = receivedJSON["time"] as! [String:NSNumber]
                        
                        var day:Int = 0
                        var time:Int = 0

                        
                        print("Adding lesson with name \(lessonName)")
                        
                        for (key, value) in eventTime {
                            //print("key: \(key) & value: \(value)")
                            
                            day = (key as NSString).integerValue
                            time = value.intValue
                            dayTime[day] = time
                        }
                    }
                    

                    
                    lessonIdName[lessonId] = lessonName
                    
                    studentLessons.append(SingleLesson(id: lessonId, name: lessonName, credit: lessonCredit, faculty: lessonFaculty, semester: lessonSemester, instructor: lessonInstructor, time: dayTime))
                    self.retrieveStudentLessonDetails = true
                }
            }else{
                self.retrieveStudentLessonDetails = true
            }
        }
        
        task.resume()
        
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !retrieveStudentLessonDetails

    }
}
