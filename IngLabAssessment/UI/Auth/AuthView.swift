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
        VStack {
            HStack {
                Spacer()
            }

            Image("IngAppLogo")
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFill()
                .padding(EdgeInsets(top: 120, leading: 0, bottom: 0, trailing: 0))

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
                SecureField("Password", text: $viewModel.password)
                Button {
                    print("Button was tapped")
                } label: {
                    Image("iconEyeClose")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                }
            }
            .background()
            .border(.gray)
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))

            Spacer()

            Button {

            } label: {
                Text("LOGIN")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .background(.cyan)
            }
            .frame(height: 49)
            .background(.cyan)
            .border(.gray)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 50, trailing: 20))
        }
        .background(
            Image("background")
                .resizable()
        )
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
