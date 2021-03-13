//
//  DupljeZevsVremeWidget.swift
//  DupljeZevsVremeWidget
//
//  Created by Gregor Majcen on 12/03/2021.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
  typealias Entry = SimpleEntry

  func placeholder(in context: Context) -> Entry {
    Entry()
  }

  func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
    let entry = Entry()
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    var entries: [Entry] = []

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = Entry(date: entryDate)
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let dupljeZevsVremeWidgetViewModel: DupljeZevsVremeWidgetViewModel?

  init(
    date: Date = Date(),
    dupljeZevsVremeWidgetViewModel: DupljeZevsVremeWidgetViewModel? = nil
  ) {
    self.date = date
    self.dupljeZevsVremeWidgetViewModel = dupljeZevsVremeWidgetViewModel
  }
}

@main
struct DupljeZevsVremeWidget: Widget {
  let kind: String = "DupljeZevsVremeWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      DupljeZevsVremeWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

struct DupljeZevsVremeWidget_Previews: PreviewProvider {
  static var previews: some View {
    DupljeZevsVremeWidgetEntryView(entry: SimpleEntry())
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
