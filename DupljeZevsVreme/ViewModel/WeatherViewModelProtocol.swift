//
//  WeatherViewModelProtocol.swift
//  ZevsVreme
//
//  Created by Gregor Majcen on 26/02/2021.
//

import Foundation

protocol WeatherListModelProtocol {
  var title: String { get }
  func asPairArray() -> [(String, String)]
}
