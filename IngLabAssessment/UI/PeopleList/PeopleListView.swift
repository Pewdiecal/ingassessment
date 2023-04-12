//
//  PeopleListView.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import SwiftUI

struct PeopleListView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                }
                Spacer()
            }
            .background(
                Image("background")
                    .resizable()
            )
            .ignoresSafeArea()

            VStack {
                HStack {
                    Spacer()
                }

                Text("Inglab Assessment")
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                HStack {
                    TextField("Search", text: $viewModel.search)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    Button {
                        print("Button was tapped")
                    } label: {
                        Image("iconSearch")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                    }
                }
                .background()
                .border(.gray)
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))

                List {
                    ForEach(viewModel.peoples) { people in
                        ZStack {
                            NavigationLink {
                                PeopleDetailsView(name: people.name,
                                                  avatarUrl: people.avatar,
                                                  phoneNumber: people.phone,
                                                  emailAddress: people.emailAddress,
                                                  description: people.description)
                            } label: {
                                EmptyView()
                            }
                            .opacity(0.0)
                            .listRowSeparator(.hidden)

                            VStack {
                                PeopleListCellView(imageUrlString: people.avatar ?? "", name: people.name ?? "", phoneNumber: people.phone ?? "")
                                    .listRowSeparator(.hidden)
                                Divider()
                                    .listRowSeparator(.hidden)
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .border(.gray)
                .background(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                .scrollContentBackground(.hidden)

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }

    @StateObject private var viewModel = PeopleListViewModel(networkService: NetworkService())
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
