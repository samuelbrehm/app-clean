//
//  Storyboarded.swift
//  UI-iOS
//
//  Created by Samuel Brehm on 16/05/21.
//

import Foundation
import UIKit

public protocol Storyborded {
    static func instanciate() -> Self
}

extension Storyborded where Self: UIViewController {
    public static func instanciate() -> Self {
        let vcName = String(describing: self)
        let sbName = vcName.components(separatedBy: "ViewController")[0]
        let bundle = Bundle(for: Self.self)
        let sb = UIStoryboard(name: sbName, bundle: bundle)
        return sb.instantiateViewController(identifier: vcName) as! Self
    }
}
