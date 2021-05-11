//
//  Model.swift
//  Domain
//
//  Created by Samuel Brehm on 11/05/21.
//

import Foundation

public protocol Model: Encodable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
