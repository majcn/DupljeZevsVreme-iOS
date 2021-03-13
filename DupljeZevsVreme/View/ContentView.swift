//
//  ContentView.swift
//  DupljeZevsVreme
//
//  Created by Gregor Majcen on 12/03/2021.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
  @ObservedObject var dupljeZevsVremeViewModel = DupljeZevsVremeViewModel()

  var body: some View {
    NavigationView {
      List {
        WeatherListView(model: dupljeZevsVremeViewModel.temperatureViewModel)
        WeatherListView(model: dupljeZevsVremeViewModel.humidityViewModel)
        WeatherListView(model: dupljeZevsVremeViewModel.windViewModel)
        WeatherListView(model: dupljeZevsVremeViewModel.rainViewModel)
        WeatherListView(model: dupljeZevsVremeViewModel.sunViewModel)
        WeatherListView(model: dupljeZevsVremeViewModel.pressureViewModel)
      }
      .listStyle(GroupedListStyle())
      .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
        if dupljeZevsVremeViewModel.fetch() {
          WidgetCenter.shared.reloadAllTimelines()
        }
      }
      .onAppear {
        if dupljeZevsVremeViewModel.fetch() {
          WidgetCenter.shared.reloadAllTimelines()
        }
      }
      .navigationTitle("Vreme")
      .toolbar {
        ToolbarItem(placement: .bottomBar) {
          Text("Posodobljeno \(dupljeZevsVremeViewModel.updated.dateToString()) ob \(dupljeZevsVremeViewModel.updated.timeToString())")
        }
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
