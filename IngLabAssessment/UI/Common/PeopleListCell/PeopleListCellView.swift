//
//  PeopleListCellView.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import SwiftUI
import Kingfisher

struct PeopleListCellView: View {
    var body: some View {
        HStack {
            KFImage(URL(string: imageUrlString)!)
                .resizable()
                .frame(width: 128, height: 128)

            VStack {
                Text(name)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Text(phoneNumber)
                    .fontWeight(.regular)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            Spacer()
        }
    }

    var imageUrlString: String
    var name: String
    var phoneNumber: String
}

struct PeopleListCellView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListCellView(imageUrlString: "", name: "Test", phoneNumber: "01239393")
    }
}
