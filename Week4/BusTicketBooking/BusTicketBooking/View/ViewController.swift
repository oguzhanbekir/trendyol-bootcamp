//
//  ViewController.swift
//  BusTicketBooking
//
//  Created by Oguzhan Bekir on 6.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var user = User()

    @IBOutlet weak private var nameSurnameTextField: UITextField!
    @IBOutlet weak private var fromTextField: UITextField!
    @IBOutlet weak private var toTextField: UITextField!
    @IBOutlet weak private var datePicker: UIDatePicker!
    @IBOutlet weak private var seatNumberStepper: UIStepper!
    @IBOutlet weak private var seatNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func searchButtonTapped(_ sender: Any) {
        
        if !nameSurnameTextField.text!.isEmpty, !fromTextField.text!.isEmpty, !toTextField.text!.isEmpty {
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let viewController = storyboard.instantiateViewController(identifier: "BusSeatViewController") as! BusSeatVC
            viewController.user = User(nameSurname: nameSurnameTextField.text, from: fromTextField.text, to: toTextField.text, date: datePicker.date, seatCount: Int(seatNumberStepper.value))
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            showAlert(alertText: "Hata", alertMessage: "Tüm alanları eksiksiz doldurmalısın.")
        }
        
    }
    
    @IBAction func seatNumberTapped(_ sender: UIStepper) {
        seatNumberLabel.text = "\(Int(sender.value))"
    }
 
}

