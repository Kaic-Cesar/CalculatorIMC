//
//  HomeViewModel.swift
//  CalculatorIMC
//
//  Created by Kaic Cesar on 18/06/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var height: String = ""
    @Published var weight: String = ""
    @Published var result: Double = 0.0
}
