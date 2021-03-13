//
//  RainViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

func getRainLastFormatted(_ rainLast: String) -> String {
  let fromDateFormatter = DateFormatter()
  fromDateFormatter.dateFormat = "d/M/yyyy"
  let rainLastAsDate = fromDateFormatter.date(from: rainLast)

  let toDateFormatter = DateFormatter()
  toDateFormatter.dateStyle = .short

  return rainLastAsDate.map { toDateFormatter.string(from: $0) } ?? "Neznano"
}

struct RainViewModel: WeatherListModelProtocol {
  let title = "Padavine"

  let rainrate: String
  let rainhour: String
  let raintoday: String
  let rainyesterday: String
  let rainmonth: String
  let rainyear: String
  let rainlast: String
  
  init(fromRawData rawdata: [String]) {
    self.rainrate = rawdata[8] + " " + rawdata[16] + "/hr"
    self.rainhour = rawdata[47] + " " + rawdata[16]
    self.raintoday = rawdata[9] + " " + rawdata[16]
    self.rainyesterday = rawdata[21] + " mm"
    self.rainmonth = rawdata[62] + " mm"
    self.rainyear = rawdata[20] + " mm"
    self.rainlast = getRainLastFormatted(rawdata[60]) + " (" + rawdata[61] + ")"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna jakost", self.rainrate),
      ("V zadnji uri", self.rainhour),
      ("Danes", self.raintoday),
      ("Včeraj", self.rainyesterday),
      ("Ta mesec", self.rainmonth),
      ("Letos", self.rainyear),
      ("Zadnji dež (dnevi)", self.rainlast)
    ]
  }
}
