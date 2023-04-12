//
//  PeopleDetailsView.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import SwiftUI

struct PeopleDetailsView: View {
    var name: String
    var avatarUrl: String
    var phoneNumber: String
    var emailAddress: String
    var description: String

    var body: some View {
        VStack {
            HStack {
                Spacer()
            }

            HStack {
                Button {

                } label: {
                    Image("iconBack")
                        .resizable()
                        .frame(width: 30, height: 30)
                }

                Spacer()

                Text(name)
                    .fontWeight(.black)
                    .font(.system(size: 25))
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding(EdgeInsets(top: 70, leading: 10, bottom: 0, trailing: 30))

            AsyncImage(url: URL(string: avatarUrl))
                .frame(width: 150, height: 150)
                .border(.gray)

            HStack {
                Image("iconCall")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(10)
                Text(phoneNumber)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
            }
            .background()
            .border(.cyan)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))

            HStack {
                Image("iconMail")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(10)
                Text(emailAddress)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
            }
            .background()
            .border(.cyan)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            Text(description)
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(.white)
                .border(.gray)
                .padding(20)
                .multilineTextAlignment(.leading)
                .lineLimit(0)


            Spacer()
        }
        .background(
            Image("background")
                .resizable()
        )
        .ignoresSafeArea()
    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailsView(name: "Test", avatarUrl: "", phoneNumber: "0123223232", emailAddress: "asd@asd.com", description: "Test desciption")
    }
}
