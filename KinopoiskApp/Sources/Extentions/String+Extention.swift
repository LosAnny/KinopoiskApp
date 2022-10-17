//
//  String+Extention.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 17.10.2022.
//

import Foundation

extension String {

    func truncated(after count: Int) -> String {
        let truncateAfter = index(startIndex, offsetBy: count)
        guard endIndex > truncateAfter else { return self }
        return String(self[startIndex..<truncateAfter])
    }
}
