//
//  AuthService.swift
//  Auth_2
//
//  Created by Ahreum CHO on 2020/08/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya

enum AuthService{
    case getCurrentUser(id: String, token: String)
    case register(name:String, email:String, password:String)
    case login(email:String, password:String)
    case forgetPWD(email:String)
    //  case kakaoLogin
    case faceBookLogin(userId:String, accessToken:String)
    case googleLogin(idToken: String)
    
}
extension AuthService: TargetType{
    var baseURL: URL {
        guard let url = URL(string: "https://evening-sands-57964.herokuapp.com/api") else{
            fatalError("couldn't find base URL.")
        }
        return url
    }
    
    var path: String {
        switch self  {
        case .getCurrentUser(let id, _):
            return "/user/\(id)"
        case .register(_,_,_):
            return "/register"
        case .login(_,_):
            return "/login"
        case .forgetPWD(_):
            return "/forgotpassword"
        case .faceBookLogin(_,_):
            return "/facebooklogin"
        case .googleLogin(_):
            return "/googlelogin"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCurrentUser(_,_):
            return .get
        case .register(_,_,_), .login(_,_), .faceBookLogin(_,_), .googleLogin(_):
            return .post
        case .forgetPWD(_):
            return .put
        }
    }
    
    var sampleData: Data {
        switch self {
            
        case .getCurrentUser(let id,_):
            return "{'userId':'\(id)'}".data(using: .utf8)!
        case .register(let name, let email, let password):
            return "{'name':'\(name)', 'email':'\(email)','password':'\(password)'}".data(using: .utf8)!
        case .login(let email, let password):
            return "{'email':'\(email)','password':'\(password)'}".data(using: .utf8)!
        case .forgetPWD(let email):
            return "{'email':'\(email)'}".data(using: .utf8)!
        case .faceBookLogin(let userId, let accessToken):
            return "{'userId':'\(userId)', 'accessToken':'\(accessToken)'}".data(using: .utf8)!
        case .googleLogin(let idToken):
            return "{'idToken':'\(idToken)'}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getCurrentUser(_,_):
            return .requestPlain
        case .register(let name, let email, let password):
            return .requestParameters(parameters: ["name":name, "email":email, "password":password], encoding: JSONEncoding.default)
        case .login(let email, let password):
            return .requestParameters(parameters: ["email":email,"password":password], encoding: JSONEncoding.default)
        case .forgetPWD(let email):
            return .requestParameters(parameters: ["email":email], encoding: JSONEncoding.default)
        case .faceBookLogin(let userId, let accessToken):
            return .requestParameters(parameters: ["userId":userId,"accessToken":accessToken], encoding: JSONEncoding.default)
        case .googleLogin(let idToken):
            return .requestParameters(parameters: ["idToken":idToken], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCurrentUser(_, let token):
            return ["Authorization":"Bearer \(token)"]
        default:
            return ["Content-Type":"application/json"]
        }
    }
}
