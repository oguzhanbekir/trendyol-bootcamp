//
//  ViewController.swift
//  NotificationListener
//
//  Created by Oguzhan Bekir on 5.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var notificationData: [String:Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(handleData(notification:)), name: .sendDataNotification, object: nil)
    }
    
    @objc func handleData(notification:Notification) {
        if let name = notification.userInfo?["data"] as? String {
            dataLabel.text = name
        }
    }
}

extension Notification.Name {
    static let sendDataNotification = Notification.Name(rawValue: "sendData")
}
