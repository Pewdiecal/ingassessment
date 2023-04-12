//
//  AuthViewModel.swift
//  IngLabAssessment
//
//  Created by Calvin Lau on 12/04/2023.
//

import Foundation

@MainActor class AuthViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
}
