//
//  SplashViewModel.swift
//  CalculatorIMC
//
//  Created by Kaic Cesar on 19/06/24.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.uiState = .success
        }
    }
    
    func userView() -> some View {
        return SplashViewRouter.userView()
    }
}
