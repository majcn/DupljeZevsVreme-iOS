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

  init(model: DupljeZevsVremeModel) {
    solRad = "\(model.sun.solRad) W/m2"
    et = "\(model.sun.et) mm"
    sunshineHours = "\(model.sun.sunshineHours) h"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutno sončno obsevanje", solRad),
      ("Današnje izhlapevanje vode", et),
      ("Današnje ure sonca", sunshineHours)
    ]
  }
}
