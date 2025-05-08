//
//  Untitled.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
}
