//
//  PeopleListViewModel.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import Foundation
import Combine

@MainActor class PeopleListViewModel: ObservableObject {

    init(networkService: NetworkService) {
        self.networkService = networkService
        getPeopleList()
        self.$search
            .sink { [weak self] searchString in
                guard let self = self else { return }
                var sortedPeoples: [People]
                sortedPeoples = self.peoples
                    .filter { people in
                        return people.name == searchString
                    }
                self.peoples = sortedPeoples
            }
            .store(in: &cancellables)
    }

    private func getPeopleList() {
        networkService.retrievePeopleListFromApi()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                default:
                    break
                }
            } receiveValue: { [weak self] peoples in
                guard let self = self else { return }
                self.peoples = peoples
            }
            .store(in: &cancellables)
    }

    // MARK: - Properties

    @Published var peoples: [People] = []
    @Published var search: String = ""

    // MARK: - Internals

    private let networkService: NetworkService
    private var cancellables = [AnyCancellable]()
    
}
