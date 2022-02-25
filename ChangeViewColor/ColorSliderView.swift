//
//  ColorSliderView.swift
//  ChangeViewColor
//
//  Created by Diana Ovechkina on 18.02.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var stringValue: String
    
    let color: Color
    
    var body: some View {
        HStack{
            Text("0").foregroundColor(color)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { isOnFocus in
                    stringValue = "\(lround(value))"
            }
            Text("255").foregroundColor(color)
            TextFieldView(getSliderValue: $value, sliderValue: $stringValue)
        }.padding(.horizontal)
            .onAppear {
                stringValue = "\(lround(value))"
            }
    }
    
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(0.5), stringValue: .constant(""), color: .green)
    }
}
