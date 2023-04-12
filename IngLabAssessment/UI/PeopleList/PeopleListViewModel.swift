//
//  PeopleListViewModel.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import Foundation

@MainActor class PeopleListViewModel: ObservableObject {
    @Published var peoples: [People] = []
    @Published var search: String = ""

    init() {

    }
}
