//
//  AppDetailsUIView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 20/08/2023.
//

import SwiftUI
import Kingfisher
struct AppDetailsUIView: View {
    @State var appModel:AppModel
    @Environment(\.colorScheme) private var colorScheme
    @State var rating:Int = 0
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                KFImage.url(URL(string: appModel.avatar)).resizable()
                    .frame(width: detailsWidth, height: detailsHeight)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1))
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 20)
                VStack(alignment: .leading) {
                    TextView(titleName: appModel.name, colorCode: colorScheme == .dark ? .white : .black , fontSize: 14, fontFamilyName: BOLD_FONT).padding(.top, 10)
                    TextView(titleName: appModel.description, colorCode: colorScheme == .dark ? Color.white : .gray , fontSize: 12, fontFamilyName: REGULAR_FONT)
                    HStack {
                        Button {
                            if let url = URL(string: appModel.url) {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            TextView(titleName: "GET".localize, colorCode: .white, fontSize: 14, fontFamilyName: BOLD_FONT)
                                .frame(width: 70, height: 25)
                        }.background(Color.colorBlue)
                            .frame(width: 70, height: 25)
                            .cornerRadius(40)
                            .overlay(RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.colorGray, lineWidth: 1))
                            .padding(.top, 15)
                            .buttonStyle(.borderless)
                        Spacer()
                        Button {
                            Share.actionSheet(url: appModel.url)
                        } label: {
                            Image("share").frame(width: 20,height: 20)
                        }.buttonStyle(.borderless)
                            .padding(.trailing, 20)
                    }
                    }
                }
            Divider().padding(.leading, 20).padding(.trailing, 20).padding(.top, 20)
            HStack {
                VStack (alignment: .center){
                    TextView(titleName: appModel.ratingCount + "ratingCount".localize, colorCode: colorScheme == .dark ? Color.white : .gray , fontSize: 12, fontFamilyName: REGULAR_FONT)
                    TextView(titleName: appModel.rating, colorCode: colorScheme == .dark ? Color.white : Color.colorDarkGray , fontSize: 18, fontFamilyName: REGULAR_FONT).padding(.top, 5)
//                    RatingUIView(rating: $rating).frame(width: 30, height: 40).padding(.leading, 20)
                }
                Divider().padding(.leading, 40).padding(.trailing, 20).padding(.top, 20).padding(.bottom, 20)
                VStack(alignment: .center) {
                    TextView(titleName:  "age".localize, colorCode: colorScheme == .dark ? Color.white : .gray , fontSize: 12, fontFamilyName: REGULAR_FONT).padding(.top, 5)
                    TextView(titleName: appModel.age , colorCode: colorScheme == .dark ? Color.white : Color.colorDarkGray , fontSize: 18, fontFamilyName: REGULAR_FONT).padding(.top, 5)
                    TextView(titleName: "yearsOld".localize , colorCode: colorScheme == .dark ? Color.white : .gray , fontSize: 12, fontFamilyName: REGULAR_FONT)
                        .padding(.top, 5)
                }
            }
            .frame(height: 100)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            Spacer()

        }.onAppear{
            rating = Int(appModel.rating) ?? 0
        }
    }
}

struct AppDetailsUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppDetailsUIView(appModel: AppModel())
    }
}
