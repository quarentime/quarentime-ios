//
//  DemoService.swift
//  quarentime-ios
//
//  Created by Fernando Romiti on 23/03/20.
//  Copyright © 2020 Quarentime. All rights reserved.
//

import Foundation

/// This is just a demo service as template example how to use it :)
struct DemoService: RequestType {
    
    typealias ResponseType = SomeModel
    
    var data: RequestData {
        return RequestData(path: "https://jsonblob.com/api/jsonBlob/76ddf621-d479-11e9-9fd7-333bbfd3257e", method: .get, params: RequestHeaders().getHeaders())
    }
    
}

//extension DemoService {
//
//    func neverUseMeThisFunctionIsATemplateDemo() {
//        DemoService().execute(onSuccess: { response in
//            print(response) // Response here is an SomeModel object type
//        }) { error in
//            print(error)
//        }
//    }
//
//}
