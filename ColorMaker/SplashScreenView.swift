//
//  SplashScreen.swift
//  ColorMaker
//
//  Created by Aafrin Sayani on 2023-06-10.
//

import Foundation


import SwiftUI

struct SplashScreenView: View {
  @State private var isActive: Bool = false
  @State private var size = 0.8
  @State private var opacity = 0.5
  
  
  var body: some View {
    if isActive {
      ContentView()
    } else {
      VStack {
        VStack {
          Image(systemName: "eyedropper.halffull")
            .font(.system(size: 80))
            .foregroundColor(.pink)
          Text("Color Picker")
            .font(.system(size: 30))
          
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear{
          withAnimation(.easeIn(duration: 1.2)) {
            self.size = 0.9
            self.opacity = 1.0
          }
        }
        .onAppear{
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
              self.isActive = true
            }
          }
        }
      }
    }
    
  }
}
