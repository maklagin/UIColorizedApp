//
//  ContentView.swift
//  UIColorizedApp
//
//  Created by Максим Кулагин on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 0.600
    @State private var greenSliderValue = 0.500
    @State private var blueSliderValue = 0.900

    @State private var numberColorTextField = ""
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            Capsule()
                .foregroundColor(Color(.sRGB, red: redSliderValue, green: greenSliderValue, blue: blueSliderValue))
                .frame(width: 300, height: 130)
                .overlay(Capsule().stroke(Color.white, lineWidth: 4))
            
            ColorSliderView(value: $redSliderValue, numberColor: $numberColorTextField)
                .accentColor(.red)
            
            ColorSliderView(value: $greenSliderValue, numberColor: $numberColorTextField)
                .accentColor(.green)
            
            ColorSliderView(value: $blueSliderValue, numberColor: $numberColorTextField)
                .accentColor(.blue)
            
            Spacer()
            
        }
        .padding()
        .background(Color(.sRGB, red: 0.600, green: 0.500, blue: 0.900))
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var numberColor: String
    
    var body: some View {
        
        HStack {
            
            Text(String(format: "%.2f", value))
                .frame(width: 50)
                .foregroundColor(.white)
                .font(.title3)
            
            Slider(value: $value, in: 0.0...1.0, step: 0.01)
            
            TextField("", text: $numberColor)
                .textFieldStyle(.roundedBorder)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3))
                .frame(width: 60)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
