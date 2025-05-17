# AmoradaCountryPicker-iOS

**Librería SwiftUI para seleccionar país, código telefónico o moneda.**  
Compatible con multilenguaje, Clean Architecture, SOLID y las mejores prácticas de diseño 2025.

---

## ✨ Características

- ✅ Selector de país, moneda o código telefónico.
- ✅ Basado 100% en SwiftUI.
- ✅ Compatibilidad con `@Binding` y estados reactivos.
- ✅ Soporte para múltiples idiomas (`es`, `en`, `pt`, `fr`, `de`, `ru`, `zh`, `hi`, `ar`, `jp`).
- ✅ Implementación de `CountryProvider` desacoplada para mayor flexibilidad.
- ✅ Arquitectura limpia y lista para usar en cualquier proyecto iOS moderno.

---

## 🚀 Instalación vía Swift Package Manager

1. En Xcode: `File > Add Packages`
2. Pega la URL:
```
https://github.com/AmoradaCorp/AmoradaCountryPicker-iOS.git
```
3. Selecciona la versión: `From 1.0.0`
4. Importa el módulo en tus archivos:
```swift
import AmoradaCountryPicker
```

---

## 📦 Estructura del paquete

```
AmoradaCountryPicker
├── Models
├── Providers
│   ├── CountryProvider.swift
│   └── AssetCountryProvider.swift
├── Resources
│   ├── countries_es.json
│   ├── countries_en.json
│   └── ... (otros idiomas)
├── ViewModel
├── Views
│   ├── CountryPickerView.swift
│   ├── CurrencyPickerView.swift
│   └── PhoneCodePickerView.swift
```

---

## 🧪 Ejemplo de uso

```swift
import AmoradaCountryPicker

struct ContentView: View {
    @State private var selectedCountry: Country? = nil
    private let provider = AssetCountryProvider(languageCode: "es")

    var body: some View {
        VStack {
            Text("Seleccionado: \(selectedCountry?.countryName ?? "Ninguno")")
            
            CountryPickerView(
                selectedCountry: $selectedCountry,
                countries: provider.getCountries(),
                labelText: "País de residencia",
                placeholderText: "Buscar país...",
                searchPlaceholderText: "Buscar...",
                noResultsText: "Sin resultados",
                textStyle: .body,
                labelStyle: .caption
            )
        }
        .padding()
    }
}
```

---

## 📚 Personalización

Puedes pasar estos parámetros opcionales:

- `labelText`: Texto sobre el campo.
- `placeholderText`: Texto cuando no hay selección.
- `searchPlaceholderText`: Texto en la barra de búsqueda.
- `noResultsText`: Texto cuando no hay coincidencias.
- `textStyle`: Fuente del contenido principal.
- `labelStyle`: Fuente del label.

---

## 🌍 Soporte multilenguaje

El proveedor `AssetCountryProvider` detecta automáticamente el idioma del dispositivo y carga el archivo `countries_xx.json` correspondiente. También puedes forzarlo con:

```swift
AssetCountryProvider(languageCode: "ja")
```

---

## 📝 Licencia

Distribuido bajo la licencia MIT. Ver archivo [LICENSE](LICENSE) para más detalles.
