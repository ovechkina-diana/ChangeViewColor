//
//  TextFieldView.swift
//  ChangeViewColor
//
//  Created by Diana Ovechkina on 18.02.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var getSliderValue: Double
    @Binding var sliderValue: String
    
   // @Binding var alertPresented: Bool
   
    var body: some View {
        TextField("0", text: $sliderValue, onEditingChanged: { _ in
            check()
        })
            .borded()
            .frame(width: 45, height: 10)
            .padding(.trailing)
            
    }
    
    private func check() {
        let new = String(format: "%.0f", getSliderValue)
        sliderValue = new
        
        if let new2 = Double(sliderValue) {
            getSliderValue = new2
        }
        else {
      //  alertPresented.toggle()
        return
        }
    }
}

struct BodyViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
            )
            .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

extension TextField {
    func borded() -> some View{
        ModifiedContent(
            content: self,
            modifier: BodyViewModifier()
        )
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(getSliderValue: .constant(0.5), sliderValue: .constant(""))
    }
}
