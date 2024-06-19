//
//  Gender.swift
//  CalculatorIMC
//
//  Created by Kaic Cesar on 18/06/24.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case female = "Feminino"
    
    var id: String {
        self.rawValue
    }
    
}

