//
//  HomeView.swift
//  CalculatorIMC
//
//  Created by Kaic Cesar on 17/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    @State private var showResult = false
    @State var name: String
    
    var body: some View {
        NavigationStack{
            ScrollView {
                Spacer(minLength: 20)
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        
                        
                        Text("Olá, \(name).")
                            .font(Font.system(size: 23).bold())
                            .padding(.vertical, 50)
                        
                        
                        Text("DIGITE SUA ALTURA")
                            .font(Font.system(size: 12))
                            .foregroundStyle(Color("darkGray"))
                            .padding(.bottom, 1)
                        
                        ZStack(alignment:.leading){
                            Image(systemName: "lines.measurement.vertical")
                                .padding(.leading, 10)
                                .foregroundStyle(Color("PrimaryColor"))
                            TextField("", text: $viewModel.height)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 35)
                                .foregroundStyle(.black)
                                .background(Color("PrimaryColor").opacity(0.3))
                                .cornerRadius(8.0)
                                .keyboardType(.numbersAndPunctuation)
                        }
                        .padding(.bottom, 20)
                        
                        Text("DIGITE SEU PESO")
                            .font(Font.system(size: 12))
                            .foregroundStyle(Color("darkGray"))
                            .padding(.bottom, 1)
                        
                        ZStack(alignment:.leading){
                            Image(systemName: "scalemass.fill")
                                .padding(.leading, 10)
                                .foregroundStyle(Color("PrimaryColor"))
                            TextField("", text: $viewModel.weight)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 35)
                                .foregroundStyle(.black)
                                .background(Color("PrimaryColor").opacity(0.3))
                                .cornerRadius(8.0)
                                .keyboardType(.numbersAndPunctuation)
                        }
                    }
                    .padding(.horizontal, 15)
                    
                    if viewModel.height == "" || viewModel.weight == "" {
                        NavigationLink {
                            ResultView(height: viewModel.height, weight: viewModel.weight)
                        } label: {
                            Text("Calcular")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .font(Font.system(size: 17).bold())
                        .foregroundStyle(.white)
                        .background(Color("PrimaryColor"))
                        .opacity(0.5)
                        .cornerRadius(8.0)
                        .padding(.horizontal, 15)
                        .padding(.top, 35)
                        .disabled(true)
                    } else {
                        NavigationLink {
                            ResultView(height: viewModel.height, weight: viewModel.weight)
                        } label: {
                            Text("Calcular")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .font(Font.system(size: 17).bold())
                        .foregroundStyle(.white)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(8.0)
                        .padding(.horizontal, 15)
                        .padding(.top, 35)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("backColor"))
        }
    }
}

#Preview {
    HomeView(name: "Kaic")
}



//VStack {
//    TextField("Altura", text: $height)
//        .padding(10)
//        .border(.black)
//
//    TextField("Peso", text: $weight)
//        .padding(10)
//        .border(.black)
//
//
//
//    Button("Calcular") {
//        imc = calc()
//        print(imc)
//    }
//
//    Text("Seu imc é \(imc)")
//}
//.padding()
