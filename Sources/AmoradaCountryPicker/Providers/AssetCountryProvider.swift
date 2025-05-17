//
//  AssetCountryProvider.swift
//  AmoradaCountryPicker
//
//  Created by Whiz on 15/05/25.
//

import Foundation

public class AssetCountryProvider: CountryProvider {
    private var cached: [Country]?
    private let langCode: String
    
    public init(languageCode:String? = nil) {
        self.langCode = languageCode ?? Locale.current.languageCode ?? "en"
    }
        
    public func getCountries() -> [Country] {
        if let cached = cached {
            return cached
        }
        
        let filename = "countries_\(self.langCode)"
        
        guard let url = Bundle.module.url(forResource: filename, withExtension: "json") ??
                Bundle.module.url(forResource: "countries_en", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let countries = try? JSONDecoder().decode([Country].self, from: data)
        else {
            return []
        }
        
        cached = countries
        
        return countries
    }
}
