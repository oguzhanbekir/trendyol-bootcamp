//
//  ViewController.swift
//  Question12-range-calculation
//
//  Created by Oguzhan Bekir on 30.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var angleLabel: UILabel!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var angleSlider: UISlider!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    
    let g = 10.0
    let bottlesize = 0.9
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func velocityValueChanged(_ sender: UISlider) {
        velocityLabel.text = "\(sender.value)"
    }
    
    
    @IBAction func angleValueChanged(_ sender: UISlider) {
        angleLabel.text = "\(sender.value)"
    }
    
    @IBAction func distanceValueChanged(_ sender: UISlider) {
        distanceLabel.text = "\(sender.value)"
    }
    
    @IBAction func shootButtonTapped(_ sender: Any) {

        let range = calculateRange(velocity: Double(velocitySlider.value), theta: Double(angleSlider.value))
        print(range)
        print(Double(distanceSlider.value) - bottlesize)
        print(Double(distanceSlider.value) + bottlesize)

        if Double(distanceSlider.value) - bottlesize <= range && range <= Double(distanceSlider.value) + bottlesize {
            count += 1
            scoreLabel.text = String(count)
        }
    }
    
    func sin(degrees: Double) -> Double {
        return __sinpi(degrees/180.0)
    }


    func calculateRange(velocity: Double, theta: Double) -> Double {
        
        let range = pow(velocity,2) * sin(degrees: 2*theta) / g
        
        return range
    }
}

