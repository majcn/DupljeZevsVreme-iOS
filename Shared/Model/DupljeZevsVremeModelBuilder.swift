//
//  DupljeZevsVremeModelBuilder.swift
//  DupljeZevsVreme
//
//  Created by Gregor Majcen on 12/03/2021.
//

import Foundation

enum DupljeZevsVremeModelBuilder {
  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yy HH:mm:ss"
    return formatter
  }()

  private class DupljeZevsVremeRawData {
    let rawdata: [String]

    init(from rawdata: [String]) {
      self.rawdata = rawdata
    }

    func int(_ i: Int) -> Int {
      return Int(rawdata[i])!
    }

    func double(_ i: Int) -> Double {
      return Double(rawdata[i])!
    }

    func string(_ i: Int) -> String {
      return rawdata[i]
    }

    func date(_ i: Int) -> Date {
      return dateFormatter.date(from: "\(rawdata[0]) \(rawdata[i])")!
    }
  }

  public static func build(from data: Data) -> DupljeZevsVremeModel {
    let rawdata = DupljeZevsVremeRawData(from: String(data: data, encoding: .utf8)!.components(separatedBy: " "))

    let temperature = DupljeZevsVremeModel.Temperature(
      temp: rawdata.double(2),
      tempTrend: rawdata.double(25),
      outTempTrend_6h: rawdata.double(92),
      outTempTrend_12h: rawdata.double(93),
      outTempTrend_24h: rawdata.double(94),
      todayTempHigh: rawdata.double(26),
      todayTempHighTime: rawdata.date(27),
      todayTempLow: rawdata.double(28),
      todayTempLowTime: rawdata.date(29),
      appTemp: rawdata.double(54)
    )

    let humidity = DupljeZevsVremeModel.Humidity(
      hum: rawdata.double(3),
      dew: rawdata.double(59)
    )

    let wind = DupljeZevsVremeModel.Wind(
      windLatest: rawdata.double(6),
      windDir: rawdata.string(11),
      windAvg: rawdata.double(5),
      windGust: rawdata.double(40),
      beaufort: rawdata.int(12),
      todayWindgust: rawdata.double(32),
      todayWindgustTime: rawdata.date(33),
      todayWindrun: rawdata.double(17)
    )

    let rain = DupljeZevsVremeModel.Rain(
      rainRate: rawdata.double(8),
      rainHour: rawdata.double(47),
      rainToday: rawdata.double(9),
      rainYesterday: rawdata.double(21),
      rainMonth: rawdata.double(62),
      rainYear: rawdata.double(20),
      rainLastDays: rawdata.int(61)
    )

    let sun = DupljeZevsVremeModel.Sun(
      solRad: rawdata.double(45),
      et: rawdata.double(44),
      sunshineHours: rawdata.double(55)
    )

    let pressure = DupljeZevsVremeModel.Pressure(
      pressure: rawdata.double(10),
      pressureTrend_1h: rawdata.double(96),
      pressureTrend_3h: rawdata.double(97),
      pressureTrend_6h: rawdata.double(98),
      pressureTrend_12h: rawdata.double(99),
      pressureTrend_24h: rawdata.double(100)
    )

    return DupljeZevsVremeModel(
      time: rawdata.date(1),
      location: "Zgornje Duplje",

      temperature: temperature,
      humidity: humidity,
      wind: wind,
      rain: rain,
      sun: sun,
      pressure: pressure
    )
  }
}
