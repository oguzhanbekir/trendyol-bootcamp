//
//  ViewController.swift
//  CoreDataUsage
//
//  Created by Oguzhan Bekir on 17.05.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var cookNames = [String]()
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
    }

    private func getCooks() {
        cookNames.removeAll()
        images.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else { return }
                    cookNames.append(name)
                    
                    if let imageData = result.value(forKey: "image") as? NSData {
                        if let image = UIImage(data:imageData as Data) {
                            images.append(image)
                        }
                    }
                }
                self.tableView.reloadData()
            } else {
                //TODO:
            }
        } catch {
            print("Error")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath) as? CustomTableViewCell else { fatalError() }
        
        cell.imageView?.image = images[indexPath.row]
        cell.label.text = cookNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trash = UIContextualAction(style: .destructive,
                                       title: "Delete") { [weak self] (action, view, completionHandler) in
                                        self?.handleMoveToTrash(forRowAt: indexPath)
                                        completionHandler(true)
        }
        trash.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [trash])
        return configuration
    }
    
    private func handleMoveToTrash(forRowAt: IndexPath) {
        
        let alert = UIAlertController.init(title: "Uyarı", message: "Silmek istediğinden emin misin", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Çıkış", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction.init(title: "Sil", style: .destructive, handler: { delete in
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")

            do {
                let results = try context.fetch(fetchRequest) as! [NSManagedObject]
                let data = results[forRowAt.row]
                context.delete(data)
                
                try context.save()
                print("deleted")
                
                self.cookNames.remove(at: forRowAt.row)
                self.images.remove(at: forRowAt.row)
                self.tableView.reloadData()
               
            } catch {
                print("Error")
            }
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
