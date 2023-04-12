//
//  PeopleListViewModel.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import Foundation
import Combine

@MainActor class PeopleListViewModel: ObservableObject {

    // MARK: - Initializations

    init(networkService: NetworkService) {
        self.networkService = networkService
        getPeopleList()
        self.$search
            .sink { [weak self] searchString in
                guard let self = self else { return }
                var sortedPeoples: [People] = []

                for people in self.totalPeoples {
                    if (people.name ?? "").contains(searchString) {
                        sortedPeoples.append(people)
                    }
                }

                if searchString.isEmpty {
                    self.peoples = self.totalPeoples
                } else {
                    self.peoples = sortedPeoples
                }
            }
            .store(in: &cancellables)
    }

    // MARK: - Actions

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
                    .filter { people in
                        return people.isActive ?? false
                    }
                    .sorted(by: { lhs, rhs in
                        return lhs.index ?? 0 < rhs.index ?? 0
                    })
                self.totalPeoples = self.peoples
            }
            .store(in: &cancellables)
    }

    // MARK: - Properties

    @Published var peoples: [People] = []
    @Published var search: String = ""

    // MARK: - Internals

    private let networkService: NetworkService
    private var totalPeoples: [People] = []
    private var cancellables = [AnyCancellable]()
    
}
