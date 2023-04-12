//
//  ContentView.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        NavigationStack {
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

                    Image("IngAppLogo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFill()
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))

                    Text("Inglab Assessment")
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))

                    HStack {
                        Image("iconUser")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        TextField("Username", text: $viewModel.username)
                    }
                    .background()
                    .border(.gray)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))

                    HStack {
                        Image("iconPassword")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)

                        if viewModel.isSecured {
                            SecureField("Password", text: $viewModel.password)
                        } else {
                            TextField("Password", text: $viewModel.password)
                        }

                        Button {
                            viewModel.isSecured.toggle()
                        } label: {
                            Image(viewModel.isSecured ? "iconEyeClose" : "iconEyeOpen")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                        }
                    }
                    .background()
                    .border(.gray)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))

                    Spacer()

                    NavigationLink(destination: PeopleListView()) {
                        Text("LOGIN")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .background(.cyan)
                    }
                    .buttonStyle(.plain)
                    .frame(height: 49)
                    .background(.cyan)
                    .border(.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
