//
//  UserListViewController.swift
//  ChatAppWithFireBase
//
//  Created by 村上拓也 on 2022/09/11.
//

import UIKit
import FirebaseFirestore
import Nuke

class UserListViewController: UIViewController {
    
    private let cellId = "cellId"
    private var users = [User]()
    @IBOutlet weak var userListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTableView.delegate = self
        userListTableView.dataSource = self
        fetchUserInfoFromFirestore()
    }
    
    private func fetchUserInfoFromFirestore() {
        Firestore.firestore().collection("users").getDocuments { [self] (snapshots, err) in
            if let err = err {
                print("user情報の取得に失敗しました\(err)")
                return
            }
            
            snapshots?.documents.forEach({ (snapshot) in
                let dic = snapshot.data()
                let user = User.init(dic: dic)
                
                self.users.append(user)
                self.userListTableView.reloadData()
            })
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserListTableViewCell
            cell.user = users[indexPath.row]
        return cell
    }
}

class UserListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    var user: User? {
        didSet {
            userNameLabel.text = user?.username
            
            if let url = URL(string: user?.profileImageUrl ?? ""){
                Nuke.loadImage(with: url, into: userImageView)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
