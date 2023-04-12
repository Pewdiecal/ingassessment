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
                var sortedPeoples: [People] = []

                for people in self.peoples {
                    if (people.name ?? "").contains(searchString) {
                        sortedPeoples.append(people)
                    }
                }

                if searchString.isEmpty {
                    self.getPeopleList()
                } else {
                    self.peoples = sortedPeoples
                }
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
                    .filter { people in
                        return people.isActive ?? false
                    }
                    .sorted(by: { lhs, rhs in
                        return lhs.index ?? 0 < rhs.index ?? 0
                    })
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
