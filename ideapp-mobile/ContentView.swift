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

var studentEvents: [SingleEvent] = []

var studentLessons: [SingleLesson] = []
var studentLessonNames: [String] = []
var dayNumber: Int = 1
var hourNumber: Int = 1

var type = 0


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
                print("Lesson \(lesson)")
                var lessonName: String = lesson as! String
                print("Adding lesson \(lessonName)")
                manager.retrieveStudentLessonDone = false
                manager.retrieveLessonDetails(name: lessonName)
            }
        }
        
        
        if manager.retrieveStudentLessonDetails{
            for lesson in studentLessons{
                print("Full Lesson Details \(lesson)")
            }
        }
    }
    
    init() {
        
        // Delete the following after testing
        // test1@etu.edu.tr
        
        UserDefaults.standard.set(true, forKey: "Token")
        UserDefaults.standard.set(0, forKey: "Type")
        
        print("Setting test1@etu.edu.tr to the UserDefaults.standard")
        UserDefaults.standard.set("test1@etu.edu.tr", forKey: "Email")
        
        // Until here
        
        var isAuthorized: Bool = UserDefaults.standard.bool(forKey: "Token")
    
        if isAuthorized == true {
            var userMail: String = UserDefaults.standard.string(forKey: "Email")!

            _showLogin = State(initialValue: false) // normalle false
            _showHomeScreen = State(initialValue: true)
            
            
            var userType: Int = UserDefaults.standard.integer(forKey: "Type")
            
            if (userType == 1){
                            print("Instructor")
                            manager.retrieveStudentLessons(mail: userMail, type: "Instructor")
                            manager.profileInfo(collection: "Instructor")
                            
                        }else{
                            print("Student")
                            manager.retrieveStudentLessons(mail: userMail, type: "students")
                            manager.profileInfo(collection: "students")
                        }
            
            checkLessons()
            checkEvents()
        }
    }
    
    var body: some View {

        
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
    
    var profileInfoDone = false
    
    func profileInfo(collection: String){
        
        let body: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": UserDefaults.standard.string(forKey: "Email")! ] ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var receivedHASHDone = ""
        
        print("-----> body: \(body)")
        print("-----> jsonData: \(jsonData)")
        
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
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                
                var receivedJSON = responseJSON["document"] as! [String:Any]
                var receivedHASH: String = receivedJSON["password"] as! String
                
                // control mechanism to check collection type
                if (collection == "students") {
                    name = receivedJSON["name"] as! String
                    sirname = receivedJSON["sirname"] as! String
                    var tempID = receivedJSON["student_id"] as! Int
                    studentId = "\(tempID)"
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
        
        repeat{
            
        } while receivedHASHDone == ""
        print("Here")
    }
    
    // Write the given dictionary to the db
    func createLesson(lesson: NSDictionary){
        
        let body: [String: Any] = ["collection": "Lesson",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "document": lesson ]
        
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
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
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
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                
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
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                self.done = true
            }
            
        }
        
        task.resume()
    }
    
    // Login the user depending on the inputs given
    func login(user: NSDictionary, collection: String) -> Bool{
        
        let body: [String: Any] = ["collection": collection,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": user["email"] ] ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var receivedHASHDone = ""
        
        print("-----> user: \(user)")
        print("-----> body: \(body)")
        print("-----> jsonData: \(jsonData)")
        
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
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                
                var receivedJSON = responseJSON["document"] as! [String:Any]
                var receivedHASH: String = receivedJSON["password"] as! String
                
                receivedHASHDone = receivedHASH
                
                var givenPassword: String = user["password"] as! String
                
                print("givenPassword \(givenPassword) & receivedHASH \(receivedHASH)")
            
                
                if let tempAuthValue = BCryptSwift.verifyPassword(givenPassword, matchesHash: receivedHASH){
                    
                    self.isAuthorized = tempAuthValue
                    self.loginDone = true
                }else{
                    self.isAuthorized = false
                    self.loginDone = true
                }
                
                print("isAuthorized function \(self.isAuthorized)")
                
            }
            
        }
        
        task.resume()
        
        // Necessary for the program to wait until the whole request is received
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !loginDone

        
        print("return isAuthorized function \(self.isAuthorized)")
        
        repeat{
            
        } while receivedHASHDone == ""
        
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
        
        
        
        print("-----> body: \(body)")
        print("-----> jsonData: \(jsonData)")
        
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
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> retrieveEVents responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> retrieveEVents responseJSON: \(responseJSON)")
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
                        print("key: \(key) & value: \(value)")
                        
                        day = (key as NSString).integerValue
                        hour = value.intValue

                        time["\(day)"] = hour
                    }
                    
                    studentEvents.append(SingleEvent(id: eventId,name: eventName, time: time))
    
                }
                
                print("studentEvents.count \(studentEvents.count)")
                print("eventTime.count \(receivedJSON.count)")
                if studentEvents.count == receivedJSON.count {
                    self.retrieveEventDone = true
                }
                
                print("retrieveEvents \(receivedJSON)")
                print("studentEvents \(studentEvents)")
                
                
                
            }
            
        }
        
        task.resume()
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !retrieveEventDone

    }
    
    func retrieveStudentLessons(mail:String, type:String){
        
        print("retrieveStudentLessons - \(mail) \(type)")
        
        let body: [String: Any] = ["collection": type,
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   "filter": ["email": mail ]
                                ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
        print("retrieveStudentLessons -----> body: \(body)")
        print("retrieveStudentLessons -----> jsonData: \(jsonData)")
        
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
            print("retrieveStudentLessons -----> data: \(data)")
            print("retrieveStudentLessons -----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("retrieveStudentLessons -----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                
                print("retrieveStudentLessons - receivedResponse \(self.receivedResponse)")
                
                var receivedJSON = responseJSON["document"] as! [String:Any]
                
                var jsonColumn = "taken_lessons"
                if type == "Instructor" {
                    jsonColumn = "lessons_given"
                }else{
                    if receivedJSON.keys.contains("lessons_taken"){
                        jsonColumn = "lessons_taken"
                    }
                }
                
                var takenLessons: [String] = receivedJSON[jsonColumn] as! [String]
                
                var takenLessonsCount: Int = takenLessons.count
                var currentlyAdded: Int = 1
                
                for lesson in takenLessons{
                    print("Adding lesson name \(lesson) to studentLessonNames")
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
    
    func retrieveLessonDetails(name:String){
        
        let body: [String: Any] = ["collection": "Lesson",
                                   "database": "ideapp",
                                   "dataSource": "ProjectCluster",
                                   //"filter": ["code": name ]
                                   "filter": ["_id": ["$oid":name] ]
                                ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        
        
        print("-----> body: \(body)")
        print("-----> jsonData: \(jsonData)")
        
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
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
                self.receivedResponse = responseJSON
                
                
                print("receivedResponse \(self.receivedResponse)")
                
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
                
                print("Adding lesson with name \(lessonName)")
                
                for (key, value) in eventTime {
                    print("key: \(key) & value: \(value)")
                    
                    day = (key as NSString).integerValue
                    time = value.intValue
                    dayTime[day] = time
                }
                
                studentLessons.append(SingleLesson(id: lessonId, name: lessonName, credit: lessonCredit, faculty: lessonFaculty, semester: lessonSemester, instructor: lessonInstructor, time: dayTime))
                
                self.retrieveStudentLessonDetails = true
                
                
            }
            
        }
        
        task.resume()
        
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
        } while !retrieveStudentLessonDetails

    }
}
