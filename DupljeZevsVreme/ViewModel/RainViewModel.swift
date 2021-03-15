//
//  RainViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

struct RainViewModel: WeatherListModelProtocol {
  let title = "Padavine"

  let rainRate: String
  let rainHour: String
  let rainToday: String
  let rainYesterday: String
  let rainMonth: String
  let rainYear: String
  let rainLastDays: String

  init(model: DupljeZevsVremeModel) {
    rainRate = "\(model.rain.rainRate) mm/hr"
    rainHour = "\(model.rain.rainHour) mm/hr"
    rainToday = "\(model.rain.rainToday) mm"
    rainYesterday = "\(model.rain.rainYesterday) mm"
    rainMonth = "\(model.rain.rainMonth) mm"
    rainYear = "\(model.rain.rainYear) mm"
    rainLastDays = "\(model.rain.rainLastDays)"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna jakost", rainRate),
      ("V zadnji uri", rainHour),
      ("Danes", rainToday),
      ("Včeraj", rainYesterday),
      ("Ta mesec", rainMonth),
      ("Letos", rainYear),
      ("Zadnji dež (dnevi)", rainLastDays)
    ]
  }
}
