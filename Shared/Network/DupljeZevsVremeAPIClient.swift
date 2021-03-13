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
      .map { mapDataToDupljeZevsVremeModel(data: $0.data) }
      .eraseToAnyPublisher()
  }

  public static func fetch(completion: @escaping (Result<DupljeZevsVremeModel, Error>) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard error == nil else {
        completion(.failure(error!))
        return
      }
      let dupljeZevsVremeModel = mapDataToDupljeZevsVremeModel(data: data!)
      completion(.success(dupljeZevsVremeModel))
    }
    task.resume()
  }

  private static func mapDataToDupljeZevsVremeModel(data: Data) -> DupljeZevsVremeModel {
    return DupljeZevsVremeModelBuilder.build(from: data)
  }
}
