//
//  ContentView.swift
//  ChangeViewColor
//
//  Created by Diana Ovechkina on 18.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redValue = ""
    @State private var greenValue = ""
    @State private var blueValue = ""
    
    let size = CGSize(width: 10, height: 10)
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 300, height: 150)
                .foregroundColor(Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255))
        
            ColorSliderView(value: $redSliderValue, stringValue: $redValue, color: .red)
            ColorSliderView(value: $greenSliderValue, stringValue: $greenValue, color: .green)
            ColorSliderView(value: $blueSliderValue, stringValue: $blueValue, color: .blue)
            Spacer()
            
        }.padding()
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
