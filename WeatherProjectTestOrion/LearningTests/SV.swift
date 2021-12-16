////
////  SV.swift
////  WeatherProjectTestOrion
////
////  Created by Tatiana Ilvutikova on 16.12.2021.
////
//
//import SwiftUI
////
//
//import SwiftUI
//
//struct ScrollViewOffset<Content: View>: View {
//  let onOffsetChange: (CGFloat) -> Void
//  let content: () -> Content
//
//  init(
//    onOffsetChange: @escaping (CGFloat) -> Void,
//    @ViewBuilder content: @escaping () -> Content
//  ) {
//    self.onOffsetChange = onOffsetChange
//    self.content = content
//  }
//
//  var body: some View {
//    ScrollView {
//      offsetReader
//      content()
//        .padding(.top, -8)
//    }
//    .coordinateSpace(name: "frameLayer")
//    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
//  }
//
//  var offsetReader: some View {
//    GeometryReader { proxy in
//      Color.clear
//        .preference(
//          key: OffsetPreferenceKey.self,
//          value: proxy.frame(in: .named("frameLayer")).minY
//        )
//    }
//    .frame(height: 0)
//  }
//}
//
//private struct OffsetPreferenceKey: PreferenceKey {
//  static var defaultValue: CGFloat = .zero
//  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
//}
//struct SV_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollViewOffset(onOffsetChange: <#(CGFloat) -> Void#>, content: <#() -> _#>)
//    }
//}
