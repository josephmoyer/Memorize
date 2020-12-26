//
//  Array+Indentifiable.swift
//  Memorize
//
//  Created by Joseph Moyer on 12/15/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<self.count {
            if self[index].id == matching.id{
                return index
            }
        }
            return nil
        }
}
