//
//  PeopleDetailsView.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import SwiftUI
import Kingfisher

struct PeopleDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var name: String?
    var avatarUrl: String?
    var phoneNumber: String?
    var emailAddress: String?
    var description: String?

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
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("iconBack")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }

                    Spacer()

                    Text(name ?? "")
                        .fontWeight(.black)
                        .font(.system(size: 25))
                        .foregroundColor(.gray)

                    Spacer()
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 30))

                KFImage(URL(string: avatarUrl ?? "")!)
                    .resizable()
                    .frame(width: 128, height: 128)

                HStack {
                    Image("iconCall")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Text(phoneNumber ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .lineLimit(1)
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
                    Text(emailAddress ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                }
                .background()
                .border(.cyan)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                Text(description ?? "")
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .background(.white)
                    .border(.gray)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                    .multilineTextAlignment(.leading)
                    .lineLimit(100)


                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailsView(name: "Test", avatarUrl: "", phoneNumber: "0123223232", emailAddress: "asd@asd.com", description: "Test desciption")
    }
}
