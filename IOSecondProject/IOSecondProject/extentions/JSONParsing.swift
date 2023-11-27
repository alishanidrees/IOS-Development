//
//  JSONParsing.swift
//  IOSecondProject
//
//  Created by Ali Shan on 22/11/2023.
//

import Foundation
import SwiftyJSON

func decode<T: Decodable>(_ data: Data) -> (decodedType: T?, error: Error?) {
    do {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(T.self, from: data)
        return (decoded, nil)
    } catch {
        debugPrint(error)
        return (nil, error)
    }
}

func decode<T: Decodable>(_ dictionary: [String: String]) -> T? {
    do {
        let json = JSON(dictionary)
        let data = try json.rawData()
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    } catch {
        debugPrint(error)
        return nil
    }
}

func decode<T: Decodable>(_ values: Any) -> T? {
    guard let jsonValue = values as? [String: Any] else {
        return nil
    }
    do {
        let json = JSON(jsonValue)
        let data = try json.rawData()
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    } catch {
        debugPrint(error)
        return nil
    }
}
