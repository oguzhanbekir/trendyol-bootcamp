//
//  BusSeatVC.swift
//  BusTicketBooking
//
//  Created by Oguzhan Bekir on 6.05.2021.
//

import UIKit

class BusSeatVC: UIViewController {
    
    var user = User()
    
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var fromLabel: UILabel!
    @IBOutlet weak private var toLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.allowsMultipleSelection = true

        fromLabel.text = user.from
        toLabel.text = user.to
        dateLabel.text = user.date?.description
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func makeReservationButtonTapped(_ sender: Any) {
        
        let items = collectionView.indexPathsForSelectedItems
        if user.seatCount == items?.count {
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let viewController = storyboard.instantiateViewController(identifier: "ticketViewController") as! TicketVC
            viewController.user = user
            viewController.seats = items!
            navigationController?.pushViewController(viewController, animated: true)
            
        } else {
            showAlert(alertText: "Hata", alertMessage: "Eksik koltuk seçtiniz")
        }
    }
    
}

extension BusSeatVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 45
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath as IndexPath) as! SeatCVCell
        cell.seatLabel?.text? = (indexPath.row + 1).description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return (collectionView.indexPathsForSelectedItems?.count ?? 0) < user.seatCount ?? 1
    }
    
    
}
