//
//  CurrentWeatherViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 22/02/2021.
//

import Foundation

private let beaufortScaleDesc = [
  "Tišina",
  "Lahek vetrič",
  "Vetrič",
  "Slab veter",
  "Zmeren veter",
  "Zmerno močan veter",
  "Močan veter",
  "Zelo močan veter",
  "Viharni veter",
  "Vihar"
]

struct CurrentWeatherViewModel {
  let location: String
  let time: String
  let temperature: String
  let apparentTemperature: String
  let humidity: String
  let windSpeed: String
  let wind: String

  init(model: CurrentWeather) {
    self.location = "Zgornje Duplje"

    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"

    self.time = formatter.string(from: Date(timeIntervalSince1970: model.time))
    self.temperature = "\(model.temperature) ºC"
    self.apparentTemperature = "\(model.apparentTemperature) ºC"
    self.humidity = "\(round(model.humidity))%"
    self.windSpeed = "\(round(model.avgWindSpeed)) \(model.windSpeedUnit)"
    self.wind = beaufortScaleDesc[model.windBeaufort]
  }
}

extension CurrentWeatherViewModel {
  static let mock: CurrentWeatherViewModel = {
    let model = CurrentWeather(
      time: Date().timeIntervalSince1970,
      temperature: 0,
      apparentTemperature: 0,
      humidity: 76,
      windBeaufort: 0,
      avgWindSpeed: 0,
      gustWindSpeed: 0,
      windSpeedUnit: "km/h"
    )

    return CurrentWeatherViewModel(model: model)
  }()
}
