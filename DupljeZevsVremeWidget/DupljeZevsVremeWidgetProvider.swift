//
//  DupljeZevsVremeWidgetProvider.swift
//  DupljeZevsVremeWidgetExtension
//
//  Created by Gregor Majcen on 14/03/2021.
//

import WidgetKit
import Combine

struct DupljeZevsVremeWidgetProvider: TimelineProvider {
  typealias Entry = DupljeZevsVremeWidgetViewModel

  func placeholder(in context: Context) -> Entry {
    DupljeZevsVremeWidgetViewModel.initTimelineEntry
  }

  func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
    completion(DupljeZevsVremeWidgetViewModel.initTimelineEntry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    let currentDate = Date()
    let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!

    DupljeZevsVremeAPIClient.fetch { result in
      let dupljeZevsVremeWidgetViewModel: DupljeZevsVremeWidgetViewModel
      if case .success(let data) = result {
        dupljeZevsVremeWidgetViewModel = DupljeZevsVremeWidgetViewModel(model: data)
      } else {
        dupljeZevsVremeWidgetViewModel = DupljeZevsVremeWidgetViewModel.initTimelineEntry
      }

      let timeline = Timeline(entries: [dupljeZevsVremeWidgetViewModel], policy: .after(refreshDate))
      completion(timeline)
    }
  }
}

// MARK: -

extension DupljeZevsVremeWidgetViewModel: TimelineEntry {
  var date: Date {
    time
  }
}
