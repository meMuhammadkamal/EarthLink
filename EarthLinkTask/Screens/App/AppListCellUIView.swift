//
//
//  AppListCellUIView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//

import SwiftUI
import Kingfisher
struct AppListCellUIView: View {
    @State var collection:AppModel
    @State private var showAlert:Bool = false
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack {
                KFImage.url(URL(string: collection.avatar)).resizable()
                    .frame(width: width, height: height)
                    .cornerRadius(10)
                  .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1))
                    .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                    TextView(titleName: collection.name, colorCode: colorScheme == .dark ? .white : .black , fontSize: 14, fontFamilyName: BOLD_FONT)
                TextView(titleName: collection.description, colorCode: colorScheme == .dark ? Color.white : .gray , fontSize: 12, fontFamilyName: REGULAR_FONT)
            }
            Spacer()
            Button {
                if let url = URL(string: collection.url) {
                    UIApplication.shared.open(url)
                }
            } label: {
                TextView(titleName: "GET".localize, colorCode: colorScheme == .dark ? .white : Color.colorBlue , fontSize: 14, fontFamilyName: BOLD_FONT)
                    .frame(width: 70, height: 25)
            }.background(Color.colorGray)
            .frame(width: 70, height: 25)
                .cornerRadius(40)
              .overlay(RoundedRectangle(cornerRadius: 40)
                .stroke(Color.colorGray, lineWidth: 1))
              .padding(.trailing, 10)
              .buttonStyle(.borderless)
        }
    }
}
