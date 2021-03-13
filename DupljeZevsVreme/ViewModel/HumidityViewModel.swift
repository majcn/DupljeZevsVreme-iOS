//
//  HumidityViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

struct HumidityViewModel: WeatherListModelProtocol {
  let title = "Vlažnost"

  let hum: String
  let dew: String

  init(fromRawData rawdata: [String]) {
    self.hum = rawdata[3] + "%"
    self.dew = rawdata[59] + " °C"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna", self.hum),
      ("Temperatura rosišča", self.dew)
    ]
  }
}
