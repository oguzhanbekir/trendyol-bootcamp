//
//  SeatCVCell.swift
//  BusTicketBooking
//
//  Created by Oguzhan Bekir on 6.05.2021.
//

import UIKit

class SeatCVCell: UICollectionViewCell {
    
    @IBOutlet weak var seatLabel: UILabel?
    @IBOutlet weak var busImage: UIImageView?
    
    override var isSelected: Bool {
        didSet {
            self.busImage?.tintColor = self.isSelected ? UIColor(named: "ButtonColor") : .lightGray
        }
    }
}
