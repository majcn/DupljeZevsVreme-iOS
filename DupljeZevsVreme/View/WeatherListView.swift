//
//  WeatherListView.swift
//  DupljeZevsVreme
//
//  Created by Gregor Majcen on 12/03/2021.
//

import SwiftUI

private struct Row: View {
  let title: String
  let value: String

  var body: some View {
    HStack {
      Text(title)
      Spacer()
      Text(value)
    }
  }
}

struct WeatherListView: View {
  let model: WeatherListModelProtocol

  var body: some View {
    Section(header: Text(model.title)) {
      ForEach(model.asPairArray(), id: \.0) { title, value in
        Row(title: title, value: value)
      }
    }
  }
}


struct WeatherListView_Previews: PreviewProvider {
  struct PreviewModel: WeatherListModelProtocol {
    let title = "My title"

    func asPairArray() -> [(String, String)] {
      [
        ("Row 1", "10"),
        ("Row 2", "20")
      ]
    }
  }

  static let model = PreviewModel()

  static var previews: some View {
    List {
      WeatherListView(model: model)
    }.listStyle(GroupedListStyle())
  }
}
