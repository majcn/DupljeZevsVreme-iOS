//
//  DateExtension.swift
//  DupljeZevsVreme
//
//  Created by Gregor Majcen on 12/03/2021.
//

import Foundation

extension Date {
  private static let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    return formatter
  }()


  func timeToString() -> String {
    return Date.timeFormatter.string(from: self)
  }
}
