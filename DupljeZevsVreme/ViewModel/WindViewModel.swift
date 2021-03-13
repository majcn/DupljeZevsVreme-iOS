//
//  WindViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

struct WindViewModel: WeatherListModelProtocol {
  let title = "Veter"

  let windLatest: String
  let windDir: String
  let windAvg: String
  let windGust: String
  let beaufort: String
  let todayWindGust: String
  let todayWindrun: String

  init(model: DupljeZevsVremeModel) {
    windLatest = "\(model.wind.windLatest) km/h"
    windDir = model.wind.windDir
    windAvg = "\(model.wind.windAvg) km/h"
    windGust = "\(model.wind.windGust) km/h"
    beaufort = model.wind.beaufort
    todayWindGust = "\(model.wind.todayWindGust) km/h ob \(model.wind.todayWindGustTime.timeToString())"
    todayWindrun = "\(model.wind.todayWindrun) km"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna hitrost", windLatest),
      ("Smer", windDir),
      ("Povprečna hitrost (10 min)", windAvg),
      ("Najmočnejši sunek (10 min)", windGust),
      ("Beaufortova lestvica", beaufort),
      ("Današnji najmočnejši sunek", todayWindGust),
      ("Današnja pot vetra", todayWindrun)
    ]
  }
}
