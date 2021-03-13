//
//  WindViewModel.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

private let beaufortScaleDesc = [
  "Tišina",
  "Lahek vetrič",
  "Vetrič",
  "Slab veter",
  "Zmeren veter",
  "Zmerno močan veter",
  "Močan veter",
  "Zelo močan veter",
  "Viharni veter",
  "Vihar"
]

struct WindViewModel: WeatherListModelProtocol {
  let title = "Veter"

  let windlatest: String
  let winddir: String
  let windavg: String
  let windgust: String
  let beaufort: String
  let today_windgust: String
  let today_windrun: String

  init(fromRawData rawdata: [String]) {
    self.windlatest = rawdata[6] + " " + rawdata[13]
    self.winddir = rawdata[11]
    self.windavg = rawdata[5] + " " + rawdata[13]
    self.windgust = rawdata[40] + " " + rawdata[13]
    self.beaufort = Int(rawdata[12]).map { beaufortScaleDesc[$0] } ?? "Neznano"
    self.today_windgust = rawdata[32] + " km/h ob " + rawdata[33]
    self.today_windrun = rawdata[17] + " km"
  }

  func asPairArray() -> [(String, String)] {
    return [
      ("Trenutna hitrost", self.windlatest),
      ("Smer", self.winddir),
      ("Povprečna hitrost (10 min)", self.windavg),
      ("Najmočnejši sunek (10 min)", self.windgust),
      ("Beaufortova lestvica", self.beaufort),
      ("Današnji najmočnejši sunek", self.today_windgust),
      ("Današnja pot vetra", self.today_windrun)
    ]
  }
}
