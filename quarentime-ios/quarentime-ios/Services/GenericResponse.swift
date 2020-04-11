//
//  GenericResponse.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 10/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation

struct GenericResponse: Codable {
    
    let request_id: String
    let result: String?
    
}
