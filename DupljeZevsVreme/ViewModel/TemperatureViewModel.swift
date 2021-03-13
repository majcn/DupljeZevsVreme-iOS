//
//  TemperatureViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

struct TemperatureViewModel: WeatherListModelProtocol {
  let title = "Temperatura"

  let temp: String
  let tempTrend: String
  let outTempTrend_6h: String
  let outTempTrend_12h: String
  let outTempTrend_24h: String
  let todayTempHigh: String
  let todayTempLow: String
  let appTemp: String

  init(model: DupljeZevsVremeModel) {
    temp = "\(model.temperature.temp) °C"
    tempTrend = "\(model.temperature.tempTrend) °C"
    outTempTrend_6h = "\(model.temperature.outTempTrend_6h) °C"
    outTempTrend_12h = "\(model.temperature.outTempTrend_12h) °C"
    outTempTrend_24h = "\(model.temperature.outTempTrend_24h) °C"
    todayTempHigh = "\(model.temperature.todayTempHigh) °C"
    todayTempLow = "\(model.temperature.todayTempLow) °C"
    appTemp = "\(model.temperature.appTemp) °C"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna", temp),
      ("Sprememba v zadnji uri", tempTrend),
      ("Pred 6h", outTempTrend_6h),
      ("Pred 12h", outTempTrend_12h),
      ("Pred 24h", outTempTrend_24h),
      ("Današnja najvišja", todayTempHigh),
      ("Današnja najnižja", todayTempLow),
      ("Občutek temperature", appTemp)
    ]
  }
}
