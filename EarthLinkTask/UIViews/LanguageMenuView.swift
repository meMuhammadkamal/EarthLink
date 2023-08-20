//
//  LanguageMenuView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import SwiftUI

struct LanguageMenuView: View {
    @State private var selection = ""
    let langs = ["En", "Ar"]

    var body: some View {
        HStack{
            Spacer()
            HStack {
                Spacer()
                Menu {
                    ForEach(langs, id: \.self) { client in
                        Button( client) {
                            if  client == ARA {
                                Language.changeLanguage(selection: AR_LANG)
                            } else {
                                Language.changeLanguage(selection: EN_LANG)
                            }
                            checkLanguageAndnavigateHome()
                        }
                    }
                } label: {
                    VStack(spacing: 5) {
                        HStack {
                            if Language.currentLanguage() == AR_LANG {
                                TextView(titleName: ARA , colorCode:  .black, fontSize: 14, fontFamilyName: REGULAR_FONT)
                            } else {
                                TextView(titleName: ENG , colorCode:  .black, fontSize: 14, fontFamilyName: REGULAR_FONT)
                            }

                            Spacer()
                            Image("dropdown")
                                .frame(width: 5, height: 5)
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding()
                    }
                }
            }
            .frame(width: 80, height: 35)
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color.colorLightGray, lineWidth: 1.0)
            )
            .padding(.horizontal)
        }
        
    }
}

struct LanguageMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageMenuView()
    }
}
