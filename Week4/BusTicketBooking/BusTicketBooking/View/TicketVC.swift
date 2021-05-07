//
//  TicketVC.swift
//  BusTicketBooking
//
//  Created by Oguzhan Bekir on 6.05.2021.
//

import UIKit

class TicketVC: UIViewController {
    var user = User()
    var seats = [IndexPath]()
    
    @IBOutlet weak private var fromLabel: UILabel!
    @IBOutlet weak private var toLabel: UILabel!
    @IBOutlet weak private var nameSurnameLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var seatsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromLabel.text = user.from
        toLabel.text = user.to
        nameSurnameLabel.text = user.nameSurname
        dateLabel.text = user.date?.description
        seatsLabel.text = ""
        
        for item in seats {
            seatsLabel.text! += "\(item[1] + 1) - "
        }
    }

    @IBAction func backToHomePageTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "homeViewController") as! ViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
