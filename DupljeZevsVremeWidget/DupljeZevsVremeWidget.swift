//
//  DupljeZevsVremeWidget.swift
//  DupljeZevsVremeWidget
//
//  Created by Gregor Majcen on 12/03/2021.
//

import WidgetKit
import SwiftUI

@main
struct DupljeZevsVremeWidget: Widget {
  let kind: String = "DupljeZevsVremeWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: DupljeZevsVremeWidgetProvider()) {
      DupljeZevsVremeWidgetEntryView(dupljeZevsVremeWidgetViewModel: $0)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}
