//
//
//  AppListUIView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 18/08/2023.
//


import SwiftUI
import Kingfisher
struct AppListUIView: View {
    @State var searchText: String
    @State var isSearching = false
    @Binding var placeholder: String
    var items: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    let columns = [
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center)]
    @ObservedObject var appListViewModel = AppListViewModel()
    @State var collection  = [AppModel]()
    @State var error:ApiError?
    @State  var showAlert = false
    @State  var alertType:Int = regularAlert
    @State  var title:String = ""
    @State  var message:String = ""
    @State  var isConnected:Bool = true
    var body: some View {
        NavigationView {
         VStack (alignment: .leading) {
            HStack {
                TextView(titleName: "featuredApps".localize, colorCode: .black, fontSize: 24, fontFamilyName: BOLD_FONT)
                    .padding(.leading, 30)
                Spacer()
                LanguageMenuView()
                    .padding(.trailing, 20)
            }

            SearchBar(searchText: searchText, isSearching: $isSearching, placeholder: $placeholder)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .frame(height: 50)
             if let collections =  appListViewModel.collections, collections.isEmpty {
                 HStack {
                     Spacer()
                     VStack(alignment: .center) {
                         Image("no-data").frame(width: 200, height:300)
                         TextView(titleName: "noFeatured".localize, colorCode: Color.colorLightGray, fontSize: 18, fontFamilyName: REGULAR_FONT)
                         Button {
                             let reachability = Reachability()
                             reachability.monitorNetwork { isConnected in
                                 self.isConnected = isConnected
                             }
                             appListViewModel.fetchList()
                         } label: {
                             TextView(titleName: "reload".localize, colorCode: Color.colorBlue , fontSize: 14, fontFamilyName: BOLD_FONT)
                                 .frame(width: 70, height: 25)
                         }
                     }
                     Spacer()
                 } .padding(.top, 40)
                     .opacity(collection.isEmpty ? 1:0)
             }
         if !isConnected {
             HStack {
                 Spacer()
                 VStack(alignment: .center) {
                     Image("no-signal").frame(width: 200, height:300)
                     TextView(titleName: "noInternet".localize, colorCode: Color.colorLightGray, fontSize: 18, fontFamilyName: REGULAR_FONT).padding(.leading, 20)
                         .fixedSize(horizontal: false, vertical: true)
                         .padding(.trailing, 20)
                         .multilineTextAlignment(.center)
                     Button {
                         let reachability = Reachability()
                         reachability.monitorNetwork { isConnected in
                             self.isConnected = isConnected
                         }
                         appListViewModel.fetchList()
                     } label: {
                         TextView(titleName: "reload".localize, colorCode: Color.colorBlue , fontSize: 14, fontFamilyName: BOLD_FONT)
                             .frame(width: 70, height: 25)
                     }
                 }
                 Spacer()
             }
             .padding(.top, 40)
         }
            Spacer()
             if isConnected {
                 ScrollView {
                     VStack (alignment: .leading) {
                         if let collections = appListViewModel.collections, !collections.isEmpty{
                             if let topApps = collections[0].TopApps, !topApps.isEmpty {
                                 TextView(titleName: "topApps".localize, colorCode: .black, fontSize: 24, fontFamilyName: BOLD_FONT)
                                     .padding(.leading, 30)
                                     .padding(.top,20)
                                 List {
                                     ForEach(topApps.indices, id: \.self) { index  in
                                         NavigationLink(
                                            destination: AppDetailsUIView(appModel: topApps[index]),
                                            label: {
                                                AppListCellUIView(collection: topApps[index])
                                            })
                                     }
                                 }
                                 .frame(height: cardHeight)
                                 .refreshable {

                                 }
                             }
                             if let appOfTheDay = collections[0].AppOfTheDay, !appOfTheDay.isEmpty {
                                 TextView(titleName: "appOfTheDay".localize, colorCode: .black, fontSize: 24, fontFamilyName: BOLD_FONT)
                                     .padding(.leading, 30)
                                     .padding(.top, 5)
                                 VStack{

                                     KFImage.url(URL(string: appOfTheDay[0].avatar)).resizable()
                                         .frame( height: 400)
                                         .cornerRadius(20)
                                         .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.colorGray, lineWidth: 1))
                                         .shadow(radius: 10)
                                         .aspectRatio(contentMode: .fit)

                                     TextView(titleName: appOfTheDay[0].name, colorCode: .black, fontSize: 20, fontFamilyName: BOLD_FONT)
                                         .padding(.leading, 30)
                                 }.frame(height: cardHeight)
                                     .padding(.leading, 20)
                                     .padding(.trailing, 20)
                             }

                             if let editorsChoice = collections[0].EditorsChoice, !editorsChoice.isEmpty {
                                 TextView(titleName: "editorsChoice".localize, colorCode: .black, fontSize: 24, fontFamilyName: BOLD_FONT)
                                     .padding(.leading, 30)
                                     .padding(.top, 5)
                                 List {
                                     ForEach(editorsChoice.indices, id: \.self) { index  in
                                         NavigationLink(
                                            destination: AppDetailsUIView(appModel: editorsChoice[index]),
                                            label: {
                                                AppListCellUIView(collection: editorsChoice[index])
                                            })
                                     }
                                 }.refreshable {
                                     appListViewModel.fetchList()
                                 }
                                 .frame(height: cardHeight)
                             }

                             if let mustPlayGames = collections[0].MustPlay, !mustPlayGames.isEmpty {
                                 TextView(titleName: "mustPlayGames".localize, colorCode: .black, fontSize: 24, fontFamilyName: BOLD_FONT)
                                     .padding(.leading, 30)
                                     .padding(.top, 5)
                                 List {
                                     ForEach(mustPlayGames.indices, id: \.self) { index  in
                                         NavigationLink(
                                            destination: AppDetailsUIView(appModel: mustPlayGames[index]),
                                            label: {
                                                AppListCellUIView(collection: mustPlayGames[index])
                                            })
                                     }
                                 }.refreshable {
                                     appListViewModel.fetchList()
                                 }
                                 .frame(height: cardHeight)
                             }
                         }
                     }
                     Spacer()
                 }.refreshable {
                     appListViewModel.fetchList()
                 }
                 .opacity(appListViewModel.collections?.count ?? 0 > 0 ? 1 : 0 )
             }
        }
    }
        .background(Color.colorGray)
        .onAppear() {
            let reachability = Reachability()
            reachability.monitorNetwork { isConnected in
                self.isConnected = isConnected
            }
            appListViewModel.fetchList()

        }.modifier(AlertView(showAlert: $showAlert, title: "error".localize, message: appListViewModel.apiError?.message ?? "", actionName: "OK".localize) {
                appListViewModel.fetchList()
            })
            .onChange(of: appListViewModel.apiError) { newValue in
                if newValue != nil {
                    showAlert.toggle()
                }
            }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppListUIView(searchText: "", placeholder: .constant(""))
    }
}
