//
//  SecondViewController.swift
//  QulixTest
//
//  Created by Женя  on 6.02.22.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: - Property
    
    @IBOutlet weak var tableView: UITableView!
    
    let  urlString = "https://jsonplaceholder.typicode.com/posts"
    
    var users: [User] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setupTableView()
        
    }
    
    // MARK: - Logic
    
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getData() {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else { return }
            
            var userArray: [User] = []
            
            json.forEach { json in
                guard
                    let userId = json["userId"] as? Int,
                    let title = json["title"] as? String,
                    let body = json ["body"] as? String else { return }
                
                userArray.append(User(userID: userId, title: title, body: body))
            }
            self.users = userArray
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        print(session)
        
        session.resume()
    }
    
}


//MARK: - UITableViewDataSource, UITableViewDelegate

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell else { return UITableViewCell() }
        cell.setup(with: users[indexPath.row])
        return cell
    }
    
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let descriptionStoryboard = UIStoryboard(name: "DescriptionViewController", bundle: nil)
        guard let descriptionViewConroller = descriptionStoryboard.instantiateInitialViewController() as? DescriptionViewController else { return }
        
        descriptionViewConroller.body = users[indexPath.row].body
        
        self.navigationController?.pushViewController(descriptionViewConroller, animated: true)
    }
}
