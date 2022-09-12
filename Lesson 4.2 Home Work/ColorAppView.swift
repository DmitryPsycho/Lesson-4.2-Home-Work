//
//  ContentView.swift
//  Lesson 4.2 Home Work
//
//  Created by Psycho on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    
    
    var body: some View {
        ZStack {
            VStack {
                ColorView(redValue: $redSliderValue, greenValue: $greenSliderValue, blueValue: $blueSliderValue)
                    .frame(width: 400, height: 200)
                VStack {
                    ColorChangeBlock(slider: $redSliderValue, sliderColor: .red)
                    ColorChangeBlock(slider: $greenSliderValue, sliderColor: .green)
                    ColorChangeBlock(slider: $blueSliderValue, sliderColor: .cyan)
                }
                Spacer()
            }
        }
        .padding()
        .background(Color.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorChangeBlock: View {
    @Binding var slider: Double
    let sliderColor: Color
    
    var body: some View {
        HStack {
            ColorSliderView(value: $slider, sliderColor: sliderColor)
                .frame(width: 310, height: 20, alignment: .leading)
            TextField("Value", value: $slider, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .padding()
            /* Не смог вынести текстфилд в отдельный файл, переставал работать
             форматтер.
             Подозреваю конечно, что это оверинджениринг, но тем не менее
             есть ли какие то варианты это сделать? Или же более лакончиные способы?
             */
        }
    }
}
