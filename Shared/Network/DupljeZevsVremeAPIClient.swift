//
//  DupljeZevsVremeAPIClient.swift
//  DupljeZevsVreme
//
//  Created by Gregor Majcen on 12/03/2021.
//

import Foundation
import Combine

enum DupljeZevsVremeAPIClient {
  private static let url = URL(string: "http://duplje.zevs.si/realtime2.txt")!

  public static func fetch() -> AnyPublisher<DupljeZevsVremeModel, URLError> {
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { DupljeZevsVremeModelBuilder.build(from: $0.data) }
      .eraseToAnyPublisher()
  }
}
