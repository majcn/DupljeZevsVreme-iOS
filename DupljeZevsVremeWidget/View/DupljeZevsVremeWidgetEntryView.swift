//
//  DupljeZevsVremeWidgetEntryView.swift
//  DupljeZevsVremeWidgetExtension
//
//  Created by Gregor Majcen on 13/03/2021.
//

import SwiftUI

struct DupljeZevsVremeWidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    Text(entry.date, style: .time)
  }
}
