//
//  SunViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

struct SunViewModel: WeatherListModelProtocol {
  let title = "Sonce"

  let solRad: String
  let et: String
  let sunshineHours: String

  init(fromRawData rawdata: [String]) {
    self.solRad = rawdata[45] + " W/m2"
    self.et = rawdata[44] + " mm"
    self.sunshineHours = rawdata[55] + " h"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutno sončno obsevanje", self.solRad),
      ("Današnje izhlapevanje vode", self.et),
      ("Današnje ure sonca", self.sunshineHours)
    ]
  }
}
