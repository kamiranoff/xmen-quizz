//
//  FirestoreService.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 25/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import Foundation
import Firebase

class FirestoreService: NSObject {

    static func setup() {
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }
}
