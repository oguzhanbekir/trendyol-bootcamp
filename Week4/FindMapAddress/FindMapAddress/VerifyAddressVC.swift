//
//  VerifyAddressVC.swift
//  FindMapAddress
//
//  Created by Oguzhan Bekir on 2.05.2021.
//

import UIKit

class VerifyAddressVC: UIViewController {

    var address = ""
    var dictAddress:[String:String] = [:]

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        addressTextField.text = address
        
        dictAddress =  UserDefaults.standard.value(forKey: "dictAddress") as? [String : String] ?? [:]
    }
    
    

    @IBAction func saveButtonTapped(_ sender: Any) {
        if let text = titleTF.text, !text.isEmpty {
            
            dictAddress[titleTF.text!] = addressTextField.text
            UserDefaults.standard.set(dictAddress, forKey: "dictAddress")
            navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
}
