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

  init(model: DupljeZevsVremeModel) {
    hum = "\(model.humidity.hum)%"
    dew = "\(model.humidity.dew) °C"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna", hum),
      ("Temperatura rosišča", dew)
    ]
  }
}
