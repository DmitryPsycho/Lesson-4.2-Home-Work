//
//  ColorSliderView.swift
//  Lesson 4.2 Home Work
//
//  Created by Psycho on 12.09.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    var sliderColor: Color
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .tint(sliderColor)
            .padding()
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(0), sliderColor: .red)
    }
}
