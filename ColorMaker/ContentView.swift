//
//  ContentView.swift
//  ColorMaker
//
//  Created by Aafrin Sayani on 2023-05-29.
//

import SwiftUI
import WebKit


struct ContentView: View {
  
  @State var redSliderValue = 0.0
  @State var blueSliderValue = 0.0
  @State var greenSliderValue = 0.0
  @State var alertIsVisible = false
  @State var isSet = false
  @State var name: String = ""
  
  
  var body: some View {
    
    ScrollView {
      VStack {
        VStack {
          
          // ColorName
          topTextView(redSliderValue: $redSliderValue, blueSliderValue: $blueSliderValue, greenSliderValue: $greenSliderValue, isSet: $isSet, name: $name)
          
          
          // Sliders
          SliderView(sliderValue: $redSliderValue,colorName: "Red")
          SliderView(sliderValue: $blueSliderValue, colorName: "Blue")
          SliderView(sliderValue: $greenSliderValue, colorName: "Green")
          
          // Set Button
          HStack {
            Spacer()
            setButton(alertIsVisible: $alertIsVisible, redSliderValue: $redSliderValue, blueSliderValue: $blueSliderValue, greenSliderValue: $greenSliderValue, isSet: $isSet, name: $name)
            
            // Reset Button
            Button("Reset Color".uppercased()) {
              withAnimation {
                isSet = false
                redSliderValue = 0.0
                blueSliderValue = 0.0
                greenSliderValue = 0.0
                name = ""
              }
              
              
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
            Spacer()
          }
        }
        
        Spacer()
      }
      .accentColor(Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255))
    }
  }
  
}





struct SliderView: View {
  @Binding var sliderValue: Double
  var colorName: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(colorName)
        .font(.title)
      
      HStack {
        Slider(value: $sliderValue, in: 0.0...255.0)
        Text(String(Int(sliderValue.rounded())))
          .bold()
          .font(.title2)
          .frame(width: 60)
      }
    }
    .padding()
  }
}

struct setButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var redSliderValue: Double
  @Binding var blueSliderValue: Double
  @Binding var greenSliderValue: Double
  @Binding var isSet: Bool
  @Binding var name: String
  
  var body: some View {
    Button("Set Color".uppercased()) {
      withAnimation {
        
        alertIsVisible = true
        
      }
    }
    .alert("Enter a Color Name", isPresented: $alertIsVisible) {
      TextField("Enter a Color Name", text: $name)
        .foregroundColor(.black)
      Button("OK") {
        if !name.isEmpty {
          isSet = true
        }
        else {
          isSet = false
        }
      }
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

struct topTextView: View {
  
  @Environment(\.openURL) var openURL
  @State private var isShowingWebView: Bool = false
  @Binding var redSliderValue: Double
  @Binding var blueSliderValue: Double
  @Binding var greenSliderValue: Double
  @Binding var isSet: Bool
  @Binding var name: String
  
  var body: some View {
    
    HStack{
      Spacer()
      Text(isSet ? name : "Color Name")
        .font(.system(size: 50, design: .rounded))
        .bold()
        .padding()
        .frame(maxWidth: .infinity, minHeight: 200)
        .edgesIgnoringSafeArea(.top)
      
      Button {
        withAnimation {
          isShowingWebView = true
          
        }
      } label: {
        Image(systemName: "info.circle")
          .foregroundColor(.white)
          .font(.title)
      }
      .sheet(isPresented: $isShowingWebView) {
        //        Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
        
        WebView(url: URL(string:"https://en.wikipedia.org/wiki/RGB_color_model")!)
        
        
      }
      
      Spacer()
    }
    .background(
      
      Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255)
      
    )
    .foregroundColor(.white)
    
  }
  
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
      
    }
  }
  
}
