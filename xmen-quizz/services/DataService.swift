//
//  DataService.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 08/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Firestore.firestore()
let USERS_REF = "users"
let USERNAME = "username"
let DATE_CREATED = "dateCreated"

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.collection(USERS_REF)

    var REF_BASE: Firestore {
        return _REF_BASE;
    }
    
    var REF_USERS: CollectionReference {
        return _REF_USERS;
    }
    
    func createDBUser(userId: String, username: String) {
        Firestore.firestore().collection(USERS_REF).document(userId).setData([
            USERNAME: username,
            DATE_CREATED: FieldValue.serverTimestamp()
            ], completion: { (error) in
                if let error = error {
                    return ErrorService.printError(err: error)
                }                
        })
    }
}
