//
//  ColorTextField.swift
//  Lesson 4.2 Home Work
//
//  Created by Psycho on 13.09.2022.
//

import SwiftUI

struct ColorTextField: View {
    @Binding var sliderValue: Double
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", value: $sliderValue, formatter: NumberFormatter(), onCommit: validation)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                Text("Enter correct value")
            }
    }
    
    private func validation() {
        if (0...255).contains(sliderValue) {
            sliderValue = sliderValue
            return
        }
        sliderValue = 0
        alertPresented.toggle()
    }
}

struct ColorTextField_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextField(sliderValue: .constant(0))
    }
}
