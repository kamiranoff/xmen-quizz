//
//  ErrorService.swift
//  marvel-quizz
//
//  Created by Kevin Amiranoff on 25/08/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class ErrorService: NSObject {
    static func printError(err: Error) {
        debugPrint("Error creating user: \(err.localizedDescription)")
    }
}
