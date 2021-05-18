//
//  AccountModel.swift
//  Domain
//
//  Created by Samuel Brehm on 10/05/21.
//

import Foundation

public struct AccountModel: Model {
    public var accessToken: String
    
    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
