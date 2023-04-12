//
//  NetworkService.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import Foundation
import Combine

class NetworkService {

    init() {}

    func retrievePeopleListFromApi() -> AnyPublisher<[People], Error> {
        if let url = URL(string: peopleApiUrl) {
            return URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: [People].self, decoder: JSONDecoder())
                    .receive(on: RunLoop.main)
                    .eraseToAnyPublisher()
        }

        return Empty().eraseToAnyPublisher()
    }

    // MARK: - Internals
    private let peopleApiUrl = ""
    private var cancellables = [AnyCancellable]()
}