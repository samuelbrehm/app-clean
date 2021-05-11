//
//  TestFactopries.swift
//  DataTests
//
//  Created by Samuel Brehm on 11/05/21.
//

import Foundation

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeValidData() -> Data {
    return Data("{\"data\":\"valid_data\"}".utf8)
}

func makeURL() -> URL {
    return URL(string: "http://any-url.com")!
}
