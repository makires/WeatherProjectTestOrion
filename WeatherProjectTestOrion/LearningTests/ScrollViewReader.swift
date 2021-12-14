//
//  ScrollViewReader.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 14.12.2021.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView {
                Button("Scroll to bottom") {
                    scrollView.scrollTo(99, anchor: .center)
                }

                ForEach(0..<100) { index in
                    Text(String(index))
                        .id(index)
                }
            }
        }
    }
}

struct ScrollViewReader_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
