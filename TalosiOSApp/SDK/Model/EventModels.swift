//
//  EventModels.swift
//  TalosiOSApp
//
//  Created by Sebastian Giraldo  on 11/16/20.
//

import Foundation
import ObjectMapper

public class EventsListResponse: Mappable {
    var events: [Event]?
    var message: String?
    var status: String?
    
    init() {
    }
    
    public required init?(map: Map) {
        events <- map["events"]
        message <- map["message"]
        status <- map["status"]
    }
    
    public func mapping(map: Map) {
        events <- map["events"]
        message <- map["message"]
        status <- map["status"]
    }
}

public class Event: Mappable {
    
    
    var id: String?
    var accessLink: String?
    var registerLink: String?
    var days: [String]?
    var author: String?
    var startDate: String?
    var endDate: String?
    var description: String?
    var imageLink: String?
    var name: String?
    
    init() {
    }
    
    public required init?(map: Map) {
        id <- map["_id"]
        accessLink <- map["accessLink"]
        registerLink  <- map["registerLink"]
        days <- map["days"]
        author <- map["author"]
        startDate <- map["startDate"]
        endDate <- map["endDate"]
        description <- map["description"]
        imageLink <- map["imageLink"]
        name <- map["name"]
    }
    
    public func mapping(map: Map) {
        id <- map["_id"]
        accessLink <- map["accessLink"]
        registerLink  <- map["registerLink"]
        days <- map["days"]
        author <- map["author"]
        startDate <- map["startDate"]
        endDate <- map["endDate"]
        description <- map["description"]
        imageLink <- map["imageLink"]
        name <- map["name"]
    }
}
