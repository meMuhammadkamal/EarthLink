//
//  SplashUIView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import SwiftUI

struct SplashUIView: View {
    var body: some View {
        VStack{
            Image("logo")
        }.onAppear{
            navigateHome()
        }
    }
}

func navigateHome(){
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        checkLanguageAndnavigateHome()
    }
}

struct SplashUIView_Previews: PreviewProvider {
    static var previews: some View {
        SplashUIView()
    }
}
