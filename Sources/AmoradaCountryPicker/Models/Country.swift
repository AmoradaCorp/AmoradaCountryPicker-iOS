//
//  Country.swift
//  AmoradaCountryPicker
//
//  Created by Whiz on 15/05/25.
//

import Foundation

public struct Country: Identifiable, Codable, Equatable {
    public var id = UUID()
    public var countryName: String
    public var countryCode: String
    public var phoneCode: String
    public var currencyCode: String
    public var currencyName: String?
    public var emoji: String?

    private enum CodingKeys: String, CodingKey {
        case countryName, countryCode, phoneCode, currencyCode, currencyName, emoji
    }
}
