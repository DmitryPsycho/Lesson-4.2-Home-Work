//
//  ColorView.swift
//  Lesson 4.2 Home Work
//
//  Created by Psycho on 12.09.2022.
//

import SwiftUI

struct ColorView: View {
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(UIColor(red: redValue/255, green: greenValue/255, blue: blueValue/255, alpha: 1)))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 5))
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redValue: .constant(0), greenValue: .constant(0), blueValue: .constant(0))
    }
}
