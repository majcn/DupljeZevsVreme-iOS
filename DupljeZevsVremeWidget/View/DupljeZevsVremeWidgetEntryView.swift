//
//  DupljeZevsVremeWidgetEntryView.swift
//  DupljeZevsVremeWidgetExtension
//
//  Created by Gregor Majcen on 13/03/2021.
//

import WidgetKit
import SwiftUI

struct DupljeZevsVremeWidgetEntryView: View {
  var dupljeZevsVremeWidgetViewModel: DupljeZevsVremeWidgetViewModel

  var body: some View {
    ZStack {
      BackgroundView()

      HStack {
        VStack(alignment: .leading) {
          HStack {
            Text(dupljeZevsVremeWidgetViewModel.location)
              .font(.subheadline)
              .fontWeight(.medium)
            Text(Image(systemName: "location.fill"))
              .font(.caption2)
              .fontWeight(.ultraLight)
          }

          Text(dupljeZevsVremeWidgetViewModel.temperature)
            .font(.title)
            .fontWeight(.light)

          Spacer()

          HStack {
            Text(Image(systemName: "person.fill.questionmark"))
              .font(.footnote)
              .fontWeight(.semibold)
              .frame(width: 14)
            Text(dupljeZevsVremeWidgetViewModel.apparentTemperature)
              .font(.footnote)
              .fontWeight(.semibold)
          }

          HStack {
            Text(Image(systemName: "wind"))
              .font(.footnote)
              .fontWeight(.semibold)
              .frame(width: 14)
            Text("\(dupljeZevsVremeWidgetViewModel.wind) (\(dupljeZevsVremeWidgetViewModel.windSpeed))")
              .font(.footnote)
              .fontWeight(.semibold)
          }

          HStack {
            Text(Image(systemName: "drop"))
              .font(.footnote)
              .fontWeight(.semibold)
              .frame(width: 14)
            Text(dupljeZevsVremeWidgetViewModel.humidity)
              .font(.footnote)
              .fontWeight(.semibold)
          }
        }
        .padding(.all)
        .foregroundColor(.white)

        Spacer()
      }

      VStack {
        Spacer()

        HStack {
          Spacer()

          Text(dupljeZevsVremeWidgetViewModel.time, style: .time)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.white)
        }
      }
      .padding(.all, 9.0)
    }
  }
}

struct DupljeZevsVremeWidgetEntryView_Previews: PreviewProvider {
  static var previews: some View {
    DupljeZevsVremeWidgetEntryView(dupljeZevsVremeWidgetViewModel: DupljeZevsVremeWidgetViewModel.initTimelineEntry)
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
