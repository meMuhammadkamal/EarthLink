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
            Spacer()
            ScrollView {
                VStack (alignment: .leading){

                    if let topApps = appListViewModel.collections?[0].TopApps{

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
                    }
                    if let appOfTheDay = appListViewModel.collections?[0].AppOfTheDay{
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
//                            .background(RoundedRectangle(cornerRadius: 20)
//                                .fill(Color.colorGray))
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                    }

                    if let editorsChoice = appListViewModel.collections?[0].EditorsChoice {
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
                        }.frame(height: cardHeight)
                    }

                    if let mustPlayGames = appListViewModel.collections?[0].MustPlay {
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
                        }
                        .frame(height: cardHeight)
                    }
                }
                Spacer()
            }
        }
    }
        .background(Color.colorGray)
        .onAppear() {
                appListViewModel.fetchList()
                var configuration = Configuration()
               print(configuration.environment.baseURL)
        }.modifier(AlertView(showAlert: $showAlert, title: "error".localize, message: appListViewModel.apiError?.message ?? "", actionName: "reload".localize, alertType: reloadAlert) {
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
