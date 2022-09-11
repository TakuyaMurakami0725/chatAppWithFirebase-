//
//  User.swift
//  ChatAppWithFireBase
//
//  Created by 村上拓也 on 2022/09/06.
//

import Foundation
import FirebaseFirestore

class User {
    let email: String
    let username: String
    let createAt: Timestamp
    let profileImageUrl: String
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.username = dic["username"] as? String ?? ""
        self.createAt = dic["createAt"] as? Timestamp ?? Timestamp()
        self.profileImageUrl = dic["profileImageUrl"] as? String ?? ""
    }
}
