# AmoradaCountryPicker-iOS

**Librería SwiftUI para seleccionar país, código telefónico o moneda.**  
Compatible con multilenguaje, Clean Architecture, SOLID y las mejores prácticas de diseño 2025.

---

## ✨ Características

- ✅ Selector de país, moneda o código telefónico.
- ✅ Basado 100% en SwiftUI.
- ✅ Compatibilidad con `@Binding` y estados reactivos.
- ✅ Soporte para múltiples idiomas (es, en, pt, fr, de, ru, zh, hi, ar, jp).
- ✅ Implementación de `CountryProvider` desacoplada para mayor flexibilidad.
- ✅ Arquitectura limpia y lista para usar en cualquier proyecto iOS moderno.

---

## 🚀 Instalación

Clona o añade el repositorio como submódulo o vía `Swift Package Manager` (SPM):

```
https://github.com/AmoradaCorp/AmoradaCountryPicker-iOS.git
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
                label: "Selecciona un país",
                placeholder: "Buscar país...",
                noResultsText: "Sin resultados",
                labelFont: .caption,
                textFont: .body
            )
        }
        .padding()
    }
}
```

---

## 📚 Personalización

Puedes pasar estos parámetros opcionales:

- `label`: Texto para la etiqueta.
- `placeholder`: Texto dentro del campo de búsqueda.
- `noResultsText`: Texto a mostrar si no hay resultados.
- `labelFont` y `textFont`: Tipografía de los textos.
- `singleLine`: Verdadero si quieres truncar el texto.

---

## 📝 Licencia

Distribuido bajo la licencia MIT. Ver archivo [LICENSE](LICENSE) para más detalles.
