//
//  CountryProvider.swift
//  AmoradaCountryPicker
//
//  Created by Whiz on 15/05/25.
//

public protocol CountryProvider {
    func getCountries() -> [Country]
}
