//
//  ViewController.swift
//  FindMapAddress
//
//  Created by Oguzhan Bekir on 2.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var addressDict = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressDict = UserDefaults.standard.value(forKey: "dictAddress") as? [String : String] ?? [:]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adres Ekle", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.orange

    }
    
    @objc func addTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "selectLocationViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        addressDict = UserDefaults.standard.value(forKey: "dictAddress") as? [String : String] ?? [:]
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressDict.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let array = addressDict.map { $0 }.sorted { $0.key < $1.key }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let element = array[indexPath.row]
        cell?.textLabel!.text = "\(element.key)"
        cell?.detailTextLabel!.text = "\(element.value)"
        return cell!
    }
}
