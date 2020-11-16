//
//  EventViewController.swift
//  TalosiOSApp
//
//  Created by Sebastian Giraldo  on 11/16/20.
//

import UIKit

class EventViewController: UIViewController {

    var event: Event?
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    
    @IBOutlet weak var joinView: UIView!
    @IBOutlet weak var registerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (self.event != nil) {
            eventImage.imageFromServerURL(urlString: event?.imageLink ?? "")
            eventName.text = event?.name ?? ""
            eventDescription.text = event?.description ?? ""
            setPrettyDate()
            setupButtons()
        }
    }
    
    func setPrettyDate(){
        if (self.event?.days!.count == 0){
            eventDate.text = Utils.stringToDate(date: event?.startDate ?? "").toString(dateFormat: "E, dd MMM yyyy hh:mm a")
        }else{
            var days = ""
            self.event?.days?.forEach{
                days += $0 + " "
            }
            eventDate.text = days
        }
    }
    
    func setupButtons(){
        if (self.event?.accessLink == ""){
            joinView.isHidden = true
        }
        
        if (self.event?.registerLink == "") {
            registerView.isHidden = true
        }
    }
    
    @IBAction func joinAction(_ sender: Any) {
        guard let url = URL(string: (self.event?.accessLink)!) else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        guard let url = URL(string: (self.event?.registerLink)!) else { return }
        UIApplication.shared.open(url)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
