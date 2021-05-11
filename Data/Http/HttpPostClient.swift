//
//  HttpPostClient.swift
//  Data
//
//  Created by Samuel Brehm on 11/05/21.
//

import Foundation

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?)
}
