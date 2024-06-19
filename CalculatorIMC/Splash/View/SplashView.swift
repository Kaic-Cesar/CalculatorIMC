//
//  SplashView.swift
//  CalculatorIMC
//
//  Created by Kaic Cesar on 18/06/24.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("PrimaryColor"))
            case .success:
                viewModel.userView()
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}


#Preview {
    SplashView(viewModel: SplashViewModel())
}
