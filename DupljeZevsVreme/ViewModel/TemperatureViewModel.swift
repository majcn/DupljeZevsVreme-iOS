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
  let temptrend: String
  let outTempTrend_6h: String
  let outTempTrend_12h: String
  let outTempTrend_24h: String
  let today_temphigh: String
  let today_templow: String
  let apptemp: String

  init(fromRawData rawdata: [String]) {
    self.temp = rawdata[2] + " °" + rawdata[14]
    self.temptrend = rawdata[25] + " °C"
    self.outTempTrend_6h = rawdata[92] + " °C"
    self.outTempTrend_12h = rawdata[93] + " °C"
    self.outTempTrend_24h = rawdata[94] + " °C"
    self.today_temphigh = rawdata[26] + " °C ob " + rawdata[27]
    self.today_templow = rawdata[28] + " °C ob " + rawdata[29]
    self.apptemp = rawdata[54] + " °C"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna", self.temp),
      ("Sprememba v zadnji uri", self.temptrend),
      ("Pred 6h", self.outTempTrend_6h),
      ("Pred 12h", self.outTempTrend_12h),
      ("Pred 24h", self.outTempTrend_24h),
      ("Današnja najvišja", self.today_temphigh),
      ("Današnja najnižja", self.today_templow),
      ("Občutek temperature", self.apptemp)
    ]
  }
}
