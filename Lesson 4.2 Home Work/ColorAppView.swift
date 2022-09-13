//
//  ContentView.swift
//  Lesson 4.2 Home Work
//
//  Created by Psycho on 12.09.2022.
//

import SwiftUI

struct ColorApp: View {
    enum FocusColorState {
        case red, green, blue
    }
    
    @FocusState private var focusColorState: FocusColorState?
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    
    @State private var currentTextField = FocusColorState.red
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                ColorView(redValue: $redSliderValue, greenValue: $greenSliderValue, blueValue: $blueSliderValue)
                    .frame(width: 400, height: 200)
                
                VStack {
                    ColorChangeHStack(slider: $redSliderValue, sliderColor: .red)
                        .submitLabel(.next)
                        .focused($focusColorState, equals: .red)
                    
                    ColorChangeHStack(slider: $greenSliderValue, sliderColor: .green)
                        .focused($focusColorState, equals: .green)
                    
                    ColorChangeHStack(slider: $blueSliderValue, sliderColor: .cyan)
                        .focused($focusColorState, equals: .blue)
                }
                
                Spacer()
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("\(Image(systemName: "arrowtriangle.down.fill"))") {
                                switchTextFieldColorDown()
                            }
                            Spacer()
                            Button("DONE") {
                                focusColorState = nil
                                
    // Если вы это читаете, то значит я не разобрался как увязать фокус и значение слайдера через байндинг xD
                            }
                        }
                    }
            }
        }
        .padding()
        .background(Color.accentColor)
    }
    
    private func switchTextFieldColorDown() {
        switch currentTextField {
        case .red:
            focusColorState = currentTextField
            currentTextField = .green
        case .green:
            focusColorState = currentTextField
            currentTextField = .blue
        default: 
            focusColorState = currentTextField
            currentTextField = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorApp()
    }
}

struct ColorChangeHStack: View {
    @Binding var slider: Double
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text("\(String(format: "%.0f", slider))")
                .foregroundColor(.white)
                .frame(width: 35, height: 20, alignment: .leading)
            
            ColorSliderView(value: $slider, sliderColor: sliderColor)
                .frame(width: 300, height: 20, alignment: .leading)
            
            ColorTextField(slider: $slider)
                .frame(width: 45, height: 20, alignment: .trailing)
        }
        .padding()
    }
}

