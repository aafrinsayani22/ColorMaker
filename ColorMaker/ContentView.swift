//
//  ContentView.swift
//  ColorMaker
//
//  Created by Aafrin Sayani on 2023-05-29.
//

import SwiftUI

struct ContentView: View {
  
  @State private var redSliderValue = 0.0
  @State private var blueSliderValue = 0.0
  @State private var greenSliderValue = 0.0
  @State private var alertIsVisible = false
  @State private var colorName = "Color Name"
  
  var body: some View {
    VStack {
      VStack {
      
        Text(colorName)
          .font(.largeTitle)
          .bold()
          .padding()
          .frame(maxWidth: .infinity, maxHeight: 100)
          .background(
            Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255)
          )
          .foregroundColor(.white)
        
      }
      
      SliderView(sliderValue: $redSliderValue, color: "Red", text: String(Int(redSliderValue.rounded())))
      SliderView(sliderValue: $blueSliderValue, color: "Blue", text: String(Int(blueSliderValue.rounded())))
      SliderView(sliderValue: $greenSliderValue, color: "Green",text:String(Int(greenSliderValue.rounded())))
      
      SetButton(alertIsVisible: $alertIsVisible, redSliderValue: $redSliderValue, blueSliderValue: $blueSliderValue, greenSliderValue: $greenSliderValue, colorName: $colorName)
      
      Spacer()
    }
    .accentColor(Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255))
  }
  
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var color: String
  var text: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(color)
        .font(.title)
      HStack {
        Slider(value: $sliderValue, in: 0.0...255.0)
        Text(text)
          .bold()
          .frame(width: 40)
      }
    }
    .padding()
  }
}


struct SetButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var redSliderValue: Double
  @Binding var blueSliderValue: Double
  @Binding var greenSliderValue: Double
  @Binding var colorName: String
  //  var myColor: Color
  
  func submit() {
    
    
    print("You entered \(colorName)")
  }
  
  var body: some View {
    Button("Set Color".uppercased()) {
      alertIsVisible.toggle()
    }
    .alert("Enter a Color Name", isPresented: $alertIsVisible) {
      TextField("New Color", text: $colorName)
        .foregroundColor(.black)
      Button("OK", action: submit)
    }
    .padding(20.0)
    .background(
      ZStack {
        
        Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255)
        LinearGradient(
          gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
          startPoint: .top, endPoint: .bottom)
        
      }
    )
    .overlay(
      RoundedRectangle(cornerRadius: 21)
        .strokeBorder(Color.white, lineWidth: 2)
    )
    .foregroundColor(.white)
    .cornerRadius(21)
    .bold()
    .font(.title3)
  }
  
}
