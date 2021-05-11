//
//  ExtensionHelpers.swift
//  Data
//
//  Created by Samuel Brehm on 11/05/21.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}