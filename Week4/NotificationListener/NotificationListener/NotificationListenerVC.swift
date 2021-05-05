//
//  NotificationListenerVC.swift
//  NotificationListener
//
//  Created by Oguzhan Bekir on 5.05.2021.
//

import UIKit

class NotificationListenerVC: UIViewController {
    
    var notificationData: [String:Any] = [:]
    @IBOutlet weak var sendDataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        notificationData["data"] = sendDataTextField.text
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: notificationData)
        dismiss(animated: true, completion: nil)
        
    }
    
}
