//
//  CountryPickerView.swift
//  AmoradaCountryPicker
//
//  Created by Whiz on 15/05/25.
//

import SwiftUI

public struct CountryPickerView: View {
    @Binding var selectedCountry: Country?
    private var countries: [Country]
    
    @State private var searchText: String = ""
    @State private var isExpanded: Bool = false
    
    private var placeholderText: String
    private var searchPlaceholderText: String
    private var noResultsText: String
    private var labelText: String?
    private var textStyle: Font
    private var labelStyle: Font = .caption
    
    public init(selectedCountry: Binding<Country?>,
                countries: [Country],
                placeholderText: String = "Select a country",
                searchPlaceholderText: String = "Search...",
                noResultsText: String = "No results found",
                labelText: String? = "Country",
                textStyle: Font = .body,
                labelStyle: Font = .caption
    ){
        self._selectedCountry = selectedCountry
        self.countries = countries
        self.placeholderText = placeholderText
        self.searchPlaceholderText = searchPlaceholderText
        self.noResultsText = noResultsText
        self.labelText = labelText
        self.textStyle = textStyle
        self.labelStyle = labelStyle
    }
    
    
    public var body: some View {
        VStack(alignment: .leading){
            if let labelText = labelText {
                Text(labelText)
                    .font(labelStyle)
                    .foregroundColor(.secondary)
            }
            
            Button(action:{
                withAnimation{
                    isExpanded.toggle()
                }
            }){
                HStack{
                    Text(selectedCountry.map{ "\($0.emoji ?? "") \($0.countryCode) - \($0.countryName)" } ?? placeholderText)
                        .font(textStyle)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            }
            
            if isExpanded {
                TextField(searchPlaceholderText, text: $searchText)
                    .font(textStyle)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical, 4)
                
                ScrollView{
                    LazyVStack(alignment: .leading,spacing: 8){
                        ForEach(filteredCountries(), id: \.countryCode){ country in
                            Button(action: {
                                selectedCountry = country
                                withAnimation {
                                    isExpanded = false
                                    searchText = ""
                                }
                            }){
                                Text("\(country.emoji ?? "") \(country.countryCode) - \(country.countryName)")
                                    .font(textStyle)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        if filteredCountries().isEmpty {
                            Text(noResultsText)
                                .font(textStyle)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    .padding(.vertical, 4)
                }
                .frame(maxHeight:250)
            }
        }
    }
    
    private func filteredCountries() -> [Country] {
        guard !searchText.isEmpty else {
            return countries
        }
        
        return countries.filter {
            $0.countryName.localizedCaseInsensitiveContains(searchText) ||
            $0.countryCode.localizedCaseInsensitiveContains(searchText)
        }
    }
}
