//
//  DupljeZevsVremeModel.swift
//  DupljeZevsVreme
//
//  Created by Gregor Majcen on 12/03/2021.
//

import Foundation

struct DupljeZevsVremeModel {
  struct Temperature {
    let temp: Double
    let tempTrend: Double
    let outTempTrend_6h: Double
    let outTempTrend_12h: Double
    let outTempTrend_24h: Double
    let todayTempHigh: Double
    let todayTempHighTime: Date
    let todayTempLow: Double
    let todayTempLowTime: Date
    let appTemp: Double
  }

  struct Humidity {
    let hum: Double
    let dew: Double
  }

  struct Wind {
    let windLatest: Double
    let windDir: String
    let windAvg: Double
    let windGust: Double
    let beaufort: Int
    let todayWindGust: Double
    let todayWindGustTime: Date
    let todayWindrun: Double
  }

  struct Rain {
    let rainRate: Double
    let rainHour: Double
    let rainToday: Double
    let rainYesterday: Double
    let rainMonth: Double
    let rainYear: Double
    let rainLastDays: Int
  }

  struct Sun {
    let solRad: Double
    let et: Double
    let sunshineHours: Double
  }

  struct Pressure {
    let pressure: Double
    let pressureTrend_1h: Double
    let pressureTrend_3h: Double
    let pressureTrend_6h: Double
    let pressureTrend_12h: Double
    let pressureTrend_24h: Double
  }

  let date: Date
  let location: String
  let temperature: Temperature
  let humidity: Humidity
  let wind: Wind
  let rain: Rain
  let sun: Sun
  let pressure: Pressure
}
