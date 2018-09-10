//
//  AuthService.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 08/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(
        withEmail email: String,
        andPassword password: String,
        andUsername username:String,
        userCreationComplete: @escaping (_ status: Bool,_ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                if((error) != nil) {
                    ErrorService.printError(err: error!)
                }
                userCreationComplete(false, error)
                return
            }
            let userId = user.user.uid
            
            DataService.instance.createDBUser(userId: userId, username: username)
            userCreationComplete(true, nil)
            
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool,_ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email , password: password) { (user, error) in
            if let error = error {
                ErrorService.printError(err: error)
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
        
    }
    
    func loginUser(withCredential credential: AuthCredential, loginComplete: @escaping (_ status: Bool,_ error: Error?) -> ()) {
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                ErrorService.printError(err: error)
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
    
    func getCurrentUser() -> User? {
        return Auth.auth().currentUser;
    }
    
    
    
    
}
