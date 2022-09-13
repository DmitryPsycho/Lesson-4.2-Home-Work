//
//  ColorTextField.swift
//  Lesson 4.2 Home Work
//
//  Created by Psycho on 13.09.2022.
//

import SwiftUI

struct ColorTextField: View {
    @Binding var slider: Double
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", value: $slider, formatter: NumberFormatter(), onCommit: validation)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                Text("Enter correct value")
            }
    }
    
    private func validation() {
        if (0...255).contains(slider) {
            slider = slider
            return
        } else {
            // После обновления Xcode перестал работать сброс слайдера, хотя еще буквально днем все было ок
            slider = 0
            alertPresented.toggle()
        }
    }
}

struct ColorTextField_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextField(slider: .constant(0))
    }
}
