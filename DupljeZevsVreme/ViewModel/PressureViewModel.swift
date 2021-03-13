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
  let presstrend_1h: String
  let presstrend_3h: String
  let presstrend_6h: String
  let presstrend_12h: String
  let presstrend_24h: String

  init(fromRawData rawdata: [String]) {
    self.pressure = rawdata[10] + " " + rawdata[15]
    self.presstrend_1h = rawdata[96] + " mb"
    self.presstrend_3h = rawdata[97] + " mb"
    self.presstrend_6h = rawdata[98] + " mb"
    self.presstrend_12h = rawdata[99] + " mb"
    self.presstrend_24h = rawdata[100] + " mb"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna vrednost", self.pressure),
      ("Pred 1h", self.presstrend_1h),
      ("Pred 3h", self.presstrend_3h),
      ("Pred 6h", self.presstrend_6h),
      ("Pred 12h", self.presstrend_12h),
      ("Pred 24h", self.presstrend_24h)
    ]
  }
}
