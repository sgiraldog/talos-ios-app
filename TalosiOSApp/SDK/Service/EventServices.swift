//
//  EventServices.swift
//  TalosiOSApp
//
//  Created by Sebastian Giraldo  on 11/16/20.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


enum GetEventsResponse {
    case failure(message: String)
    case success(data: EventsListResponse)
}

public class EventsServicesManager {
    func getEvents(completion: @escaping (GetEventsResponse) -> Void){
        let URL = try? "https://talos-app.herokuapp.com/api/v1/events/get-all".asURL()
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        Alamofire.request(URL!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseObject {
            (response: DataResponse<EventsListResponse>) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(message: error.localizedDescription))
            case .success(let data):
                completion(.success(data: data))
            }
        }
    }
}
