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
  
  public static func fetch() -> Future<DupljeZevsVremeModel, Error> {
    Future { promise in
      let task = URLSession.shared.dataTask(with: url) { data, _, error in
        guard error == nil else {
          promise(.failure(error!))
          return
        }
        
        let model = DupljeZevsVremeModelBuilder.build(from: data!)
        promise(.success(model))
      }
      task.resume()
    }
  }
}
