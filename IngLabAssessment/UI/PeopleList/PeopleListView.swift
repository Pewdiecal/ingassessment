//
//  PeopleListView.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import SwiftUI

struct PeopleListView: View {
    @StateObject private var viewModel = PeopleListViewModel()
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }

            Text("Inglab Assessment")
                .fontWeight(.medium)
                .font(.system(size: 20))
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))

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
                PeopleListCellView(imageUrlString: "", name: "asdas", phoneNumber: "asdasd")
                    .listRowSeparator(.hidden)
                Divider()
                    .listRowSeparator(.hidden)
            }

            Spacer()
        }
        .background(
            Image("background")
                .resizable()
        )
        .ignoresSafeArea()
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
