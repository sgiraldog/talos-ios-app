//
//  EventsListViewController.swift
//  TalosiOSApp
//
//  Created by Sebastian Giraldo  on 11/16/20.
//

import UIKit
import GoogleSignIn

class EventsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var events: [Event]?
    var selectedEvent: Event?
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Talos Events"
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        getEvents()
    }
    
    func getEvents(){
        let manager = EventsServicesManager()
        
        manager.getEvents(){ (res) in
            switch res {
            case .failure(let message):
                print(message)
                
            case .success(let data):
                if let events = data.events {
                    self.events = events
                    self.eventsTableView.reloadData()
                }
                
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventDetailSegue" {
            if let viewController = segue.destination as? EventViewController {
                viewController.event = self.selectedEvent
            }
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: EventTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "eventCell")! as! EventTableViewCell
        
        cell.eventTitle.text = events![indexPath.row].name ?? ""
        cell.eventSubtitle.text = "By: " + (events![indexPath.row].author ?? "")
        cell.eventImage.imageFromServerURL(urlString: events![indexPath.row].imageLink ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedEvent = self.events![indexPath.row]
        self.performSegue(withIdentifier: "eventDetailSegue", sender: self)
    }
}
