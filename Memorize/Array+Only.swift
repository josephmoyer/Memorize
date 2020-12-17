//
//  Array+Only.swift
//  Memorize
//
//  Created by Joseph Moyer on 12/17/20.
//

import Foundation

extension Array {
    var only:Element? {
        count == 1 ? first : nil
    }
}
