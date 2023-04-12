//
//  extensions.swift
//  Bibley
//
//  Created by Isaac Frank on 4/12/23.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
