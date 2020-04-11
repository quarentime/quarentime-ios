//
//  SetPersonalInformation.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 9/04/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation

struct SetPersonalInformation: RequestType {
    
    private let personalInformation: PersonalInformation
    
    typealias ResponseType = GenericResponse
    
    var data: RequestData {
        return RequestData(path: "\(Constants.host)/User/PersonalInformation", method: .post, params: personalInformation)
    }
    
    init(with personalInformation: PersonalInformation) {
        self.personalInformation = personalInformation
    }
    
}
