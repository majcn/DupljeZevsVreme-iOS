//
//  DupljeZevsVremeWidgetProvider.swift
//  DupljeZevsVremeWidgetExtension
//
//  Created by Gregor Majcen on 14/03/2021.
//

import WidgetKit
import Combine

class DupljeZevsVremeWidgetProvider: TimelineProvider {
  typealias Entry = DupljeZevsVremeWidgetViewModel

  private var timelineCancellable: AnyCancellable?

  func placeholder(in context: Context) -> Entry {
    DupljeZevsVremeWidgetViewModel.initTimelineEntry
  }

  func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
    completion(DupljeZevsVremeWidgetViewModel.initTimelineEntry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    let currentDate = Date()
    let refreshDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!

    self.timelineCancellable = DupljeZevsVremeAPIClient.fetch()
      .map { DupljeZevsVremeWidgetViewModel(model: $0) }
      .replaceError(with: DupljeZevsVremeWidgetViewModel.initTimelineEntry)
      .sink {
        let timeline = Timeline(entries: [$0], policy: .after(refreshDate))
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
