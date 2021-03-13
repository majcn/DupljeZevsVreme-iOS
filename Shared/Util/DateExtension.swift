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

  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }()

  func timeToString() -> String {
    return Date.timeFormatter.string(from: self)
  }

  func dateToString() -> String {
    return Date.dateFormatter.string(from: self)
  }
}
