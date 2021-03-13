//
//  DupljeZevsVremeWidgetViewModel.swift
//  DupljeZevsVremeWidgetExtension
//
//  Created by Gregor Majcen on 13/03/2021.
//

import Foundation

struct DupljeZevsVremeWidgetViewModel {
  let location: String
  let time: Date
  let temperature: String
  let apparentTemperature: String
  let humidity: String
  let windSpeed: String
  let wind: String

  init(model: DupljeZevsVremeModel) {
    location = model.location
    time = model.date
    temperature = "\(model.temperature.temp) ºC"
    apparentTemperature = "\(model.temperature.appTemp) ºC"
    humidity = "\(model.humidity.hum.rounded())%"
    windSpeed = "\(model.wind.windAvg) km/h"
    wind = model.wind.beaufort
  }
}

// MARK: -

extension DupljeZevsVremeWidgetViewModel {
  static public let initTimelineEntry: DupljeZevsVremeWidgetViewModel = {
    let data = "05/03/21 06:09:18 2.2 85 -0.1 0.0 0.0 347 0.0 0.0 1016.09 NNW 0 km/h C mb mm 1.4 -0.10 0.0 285.2 0.0 21.7 33 2.2 +0.3 2.2 06:06 1.1 00:59 1.6 00:03 6.4 00:30 1017.61 00:52 1015.51 05:15 1.9.3 1044 0.0 2.2 2.2 0 0.00 0 0 0.0 14 1 0 --- 286 m 0.2 0.0 0 0 0 -0.1 11/2/2021 21 0.0 0.0 06:34 17:55 11:21 06:04 18:25 0 00:32 09:52 0.0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 21.7 1.7 8.9 0.1 1.2 1015.72 1016.29 1017.27 1017.92 1023.74"

    return DupljeZevsVremeWidgetViewModel(model: DupljeZevsVremeModelBuilder.build(from: data.data(using: .utf8)!))
  }()
}
