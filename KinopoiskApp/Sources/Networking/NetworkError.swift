//
//  NetworkError.swift
//  KinopoiskApp
//
//  Created by Анна Лошакова on 16.10.2022.
//

import Foundation

enum NetworkError: Error {
    case noApiKey
    case urlError
    case canNoteParseData
    case otherError
}
