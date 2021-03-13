//
//  PressureViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

struct PressureViewModel: WeatherListModelProtocol {
  let title = "Tlak"

  let pressure: String
  let pressureTrend_1h: String
  let pressureTrend_3h: String
  let pressureTrend_6h: String
  let pressureTrend_12h: String
  let pressureTrend_24h: String

  init(model: DupljeZevsVremeModel) {
    pressure = "\(model.pressure.pressure) mb"
    pressureTrend_1h = "\(model.pressure.pressureTrend_1h) mb"
    pressureTrend_3h = "\(model.pressure.pressureTrend_3h) mb"
    pressureTrend_6h = "\(model.pressure.pressureTrend_6h) mb"
    pressureTrend_12h = "\(model.pressure.pressureTrend_12h) mb"
    pressureTrend_24h = "\(model.pressure.pressureTrend_24h) mb"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna vrednost", pressure),
      ("Pred 1h", pressureTrend_1h),
      ("Pred 3h", pressureTrend_3h),
      ("Pred 6h", pressureTrend_6h),
      ("Pred 12h", pressureTrend_12h),
      ("Pred 24h", pressureTrend_24h)
    ]
  }
}
