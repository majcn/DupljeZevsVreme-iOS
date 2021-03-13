//
//  DupljeZevsVremeViewModel.swift
//  DupljeZevsVreme
//
//  Created by Gregor Majcen on 12/03/2021.
//

import Foundation
import Combine

class DupljeZevsVremeViewModel: ObservableObject {
  @Published var temperatureViewModel = TemperatureViewModel(model: DupljeZevsVremeViewModel.initModel)
  @Published var humidityViewModel = HumidityViewModel(model: DupljeZevsVremeViewModel.initModel)
  @Published var windViewModel = WindViewModel(model: DupljeZevsVremeViewModel.initModel)
  @Published var rainViewModel = RainViewModel(model: DupljeZevsVremeViewModel.initModel)
  @Published var sunViewModel = SunViewModel(model: DupljeZevsVremeViewModel.initModel)
  @Published var pressureViewModel = PressureViewModel(model: DupljeZevsVremeViewModel.initModel)

  @Published var updated: Date = DupljeZevsVremeViewModel.initModel.date

  private var disposables = Set<AnyCancellable>()

  private func shouldIFetch() -> Bool {
    let currentDate = Date()
    let currentDateMinusFiveMinutes = Calendar.current.date(byAdding: .minute, value: -10, to: currentDate)!

    return currentDateMinusFiveMinutes > self.updated
  }

  func fetch(force: Bool = false) -> Bool {
    if !force && !shouldIFetch() {
      return false
    }

    DupljeZevsVremeAPIClient.fetch()
      .receive(on: RunLoop.main)
      .replaceError(with: DupljeZevsVremeViewModel.initModel)
      .sink { [weak self] model in
        guard let self = self else { return }

        self.temperatureViewModel = TemperatureViewModel(model: model)
        self.humidityViewModel = HumidityViewModel(model: model)
        self.windViewModel = WindViewModel(model: model)
        self.rainViewModel = RainViewModel(model: model)
        self.sunViewModel = SunViewModel(model: model)
        self.pressureViewModel = PressureViewModel(model: model)
        self.updated = model.date
      }
      .store(in: &disposables)

    return true
  }
}

// MARK: -

extension DupljeZevsVremeViewModel {
  static private let initModel: DupljeZevsVremeModel = {
    let data = "05/03/21 06:09:18 2.2 85 -0.1 0.0 0.0 347 0.0 0.0 1016.09 NNW 0 km/h C mb mm 1.4 -0.10 0.0 285.2 0.0 21.7 33 2.2 +0.3 2.2 06:06 1.1 00:59 1.6 00:03 6.4 00:30 1017.61 00:52 1015.51 05:15 1.9.3 1044 0.0 2.2 2.2 0 0.00 0 0 0.0 14 1 0 --- 286 m 0.2 0.0 0 0 0 -0.1 11/2/2021 21 0.0 0.0 06:34 17:55 11:21 06:04 18:25 0 00:32 09:52 0.0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 0.0 0 21.7 1.7 8.9 0.1 1.2 1015.72 1016.29 1017.27 1017.92 1023.74"

    return DupljeZevsVremeModelBuilder.build(from: data.data(using: .utf8)!)
  }()
}
