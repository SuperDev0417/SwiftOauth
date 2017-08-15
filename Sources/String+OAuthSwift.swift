//
//  String+OAuthSwift.swift
//  OAuthSwift
//
//  Created by Dongri Jin on 6/21/14.
//  Copyright (c) 2014 Dongri Jin. All rights reserved.
//

import Foundation

extension String {

    var parametersFromQueryString: [String: String] {
        return dictionaryBySplitting("&", keyValueSeparator: "=")
    }

    var urlEncodedString: String {
        let customAllowedSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
    }

    var urlQueryEncoded: String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    }

    /// Returns new url query string by appending query parameter encoding it first, if specified.
    func urlQueryByAppending(parameter name: String, value: String, encode: Bool = true) -> String? {
        if value.isEmpty {
            return self
        } else if let value: String = encode ? value.urlQueryEncoded : value {
            return "\(self)\(self.isEmpty ? "" : "&")\(name)=\(value)"
        } else {
            return nil
        }
    }

    /// Returns new url string by appending query string at the end.
    func urlByAppending(query: String) -> String {
        return "\(self)\(self.contains("?") ? "&" : "?")\(query)"
    }

    fileprivate func dictionaryBySplitting(_ elementSeparator: String, keyValueSeparator: String) -> [String: String] {
        var string = self

        if hasPrefix(elementSeparator) {
            string = String(characters.dropFirst(1))
        }

        var parameters = [String: String]()

        let scanner = Scanner(string: string)

        var key: NSString?
        var value: NSString?

        while !scanner.isAtEnd {
            key = nil
            scanner.scanUpTo(keyValueSeparator, into: &key)
            scanner.scanString(keyValueSeparator, into: nil)

            value = nil
            scanner.scanUpTo(elementSeparator, into: &value)
            scanner.scanString(elementSeparator, into: nil)

            if let key = key as String?, let value = value as String? {
                parameters.updateValue(value, forKey: key)
            }
        }

        return parameters
    }

    public var headerDictionary: OAuthSwift.Headers {
        return dictionaryBySplitting(",", keyValueSeparator: "=")
    }

    var safeStringByRemovingPercentEncoding: String {
        return self.removingPercentEncoding ?? self
    }

    var droppedLast: String {
        return self.substring(to: self.index(before: self.endIndex))
    }

    mutating func dropLast() {
        self.remove(at: self.index(before: self.endIndex))
    }

    func substring(to offset: String.IndexDistance) -> String {
        return self.substring(to: self.index(self.startIndex, offsetBy: offset))
    }

    func substring(from offset: String.IndexDistance) -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: offset))
    }
}

extension String.Encoding {

    var charset: String {
        let charset = CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(self.rawValue))
        // swiftlint:disable force_cast
        return charset! as String
    }

}
