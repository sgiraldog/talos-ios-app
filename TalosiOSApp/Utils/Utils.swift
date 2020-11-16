//
//  Utils.swift
//  TalosiOSApp
//
//  Created by Sebastian Giraldo  on 11/16/20.
//

import Foundation
import UIKit

class Utils {
    static func stringToDate(date: String) -> Date {
        let formatter = DateFormatter()

          // Format 1
          formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
          }

          // Format 2
          formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
          }

          // Nothing worked!
        return Date()
        
    }

}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        self.image = nil
        var urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
        urlStringNew = urlStringNew.replacingOccurrences(of: "\\", with: "")
        URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}


