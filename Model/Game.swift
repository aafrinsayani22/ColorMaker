////
////  Color.swift
////  ColorMaker
////
////  Created by Aafrin Sayani on 2023-06-09.
////
//
import Foundation
import SwiftUI
//
struct Game {
  @Binding var red: Double
  @Binding var green: Double
  @Binding var blue: Double
  
  mutating func set(red: Double, green: Double, blue: Double) -> Color {
   return Color(red: red, green: green, blue: blue)
  }
  
  mutating func reset() {
    red = 0.0
    green = 0.0
    blue = 0.0
  }
}
