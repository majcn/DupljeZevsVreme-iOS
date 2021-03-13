//
//  BackgroundView.swift
//  DupljeZevsVremeWidgetExtension
//
//  Created by Gregor Majcen on 13/03/2021.
//

import WidgetKit
import SwiftUI

struct BackgroundView: View {
  private static let colorScheme = [
    Color.black,
    Color(red: 20 / 255, green: 31 / 255, blue: 78 / 255),
    Color(red: 141 / 255, green: 87 / 255, blue: 151 / 255)
  ]
  
  var body: some View {
    let gradient = Gradient(colors: BackgroundView.colorScheme)
    let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    
    return Rectangle()
      .fill(linearGradient)
      .blur(radius: 200, opaque: true)
      .edgesIgnoringSafeArea(.all)
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView()
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
