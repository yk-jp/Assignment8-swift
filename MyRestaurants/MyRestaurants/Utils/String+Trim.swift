//
//  String+Trim.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-05.
//

import Foundation

extension String {
    func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
}
