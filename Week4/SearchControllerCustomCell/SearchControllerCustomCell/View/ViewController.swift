//
//  ViewController.swift
//  SearchControllerCustomCell
//
//  Created by Oguzhan Bekir on 5.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userURLString = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: userURLString) else { return }
        let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
        self.users = users!
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isFiltering ? filteredUsers.count : users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! TableViewCell
        
        let user: User
        if isFiltering {
           user = filteredUsers[indexPath.row]
       } else {
           user = users[indexPath.row]
       }
        cell.companyLabel.text = user.company.name
        cell.emailLabel.text = user.email
        cell.nameLabel.text = user.name
        cell.usernameLabel.text = user.username
        
        return cell
    }
    
    //MARK:  cell için custom bir cell tanımlayınız. Veri bulunamadığında ÖZEL bir mesaj gösteriniz.
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUsers = users.filter({ (user:User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        
        if filteredUsers.count == 0 && searchBar.text != "" {
            let alert = UIAlertController(title: "Hata", message: "Böyle bir kullanıcı bulunamadı", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                self.isFiltering = false
                self.tableView.reloadData()
                searchBar.text = ""
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        if searchBar.text == "" {
            isFiltering = false
            tableView.reloadData()
        } else {
            isFiltering = true
            tableView.reloadData()
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
