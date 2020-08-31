//
//  User.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/29.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation

struct User: Decodable {
    
    var _id: String!
    var name: String!
    var email: String!
    var role: String!
    var updatedAt: String!
    var createdAt: String!
    var __v: Int!
    
}
