//
//  CountryPickerView.swift
//  AmoradaCountryPicker
//
//  Created by Whiz on 15/05/25.
//

import SwiftUI

public struct PhoneCodePickerView: View {
    @Binding var selectedPhoneCode: Country?
    private var countries: [Country]
    
    @State private var searchText: String = ""
    @State private var isExpanded: Bool = false
    
    private var placeholderText: String
    private var searchPlaceholderText: String
    private var noResultsText: String
    private var labelText: String?
    private var textStyle: Font
    private var labelStyle: Font = .caption
    
    public init(selectedPhoneCode: Binding<Country?>,
                countries: [Country],
                placeholderText: String = "Select phone code",
                searchPlaceholderText: String = "Search...",
                noResultsText: String = "No results found",
                labelText: String? = "Phone Code",
                textStyle: Font = .body,
                labelStyle: Font = .caption
    ){
        self._selectedPhoneCode = selectedPhoneCode
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
                    Text(selectedPhoneCode.map{ "\($0.emoji ?? "") \($0.phoneCode)" } ?? placeholderText)
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
                                selectedPhoneCode = country
                                withAnimation {
                                    isExpanded = false
                                    searchText = ""
                                }
                            }){
                                Text("\(country.emoji ?? "") \(country.phoneCode)")
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
            $0.phoneCode.localizedCaseInsensitiveContains(searchText) ||
            $0.countryName.localizedCaseInsensitiveContains(searchText) ||
            $0.countryCode.localizedCaseInsensitiveContains(searchText)
        }
    }
}
