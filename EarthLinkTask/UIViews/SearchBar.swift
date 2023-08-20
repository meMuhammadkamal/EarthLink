//
//  SearchBar.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation

import SwiftUI
struct SearchBar: View {
    @State var searchText: String
    @Binding var isSearching: Bool
    @Binding var placeholder: String
    var body: some View {
        HStack {
            HStack {
                TextField("search".localize, text: $searchText)
                    .padding(.leading, 24).font(.custom(REGULAR_FONT, size: 14)).foregroundColor(Color.black)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
            .padding()
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()

                    if isSearching {
                        Button(action: { searchText = ""
                            placeholder = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })

                    }

                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.spring())

            if isSearching {
                Button(action: {
                    isSearching = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }

        }
    }
}
