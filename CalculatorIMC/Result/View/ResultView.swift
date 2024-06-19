//
//  ResultView.swift
//  CalculatorIMC
//
//  Created by Kaic Cesar on 18/06/24.
//

import SwiftUI

struct ResultView: View{
    
    @ObservedObject var viewModel = ResultViewModel()
    
    let height: String
    let weight: String
    var BatteryLevel = 52.0

    var body: some View {

        let result = Double(weight)! / (Double(height)! * Double(height)!)
        
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Resultado IMC")
                    .font(Font.system(.title).bold())
                    .foregroundStyle(Color("PrimaryColor"))
                    .padding(.top, 35)
                    .padding(.bottom, 60)
                
                VStack {
                    Text("Seu IMC é:")
                        .font(Font.system(size: 22).bold())
                        .foregroundStyle(Color("darkGray"))
                        .padding(.bottom, 10)
                        
                    
                    Text(String(format: "%.2f", result))
                        .font(.largeTitle).bold()
                        .foregroundStyle(Color("PrimaryColor"))
                        .padding(.bottom, 13)
                        
                                
                    Gauge(value: result, in: 13...40) {
                        Text("BatteryLevel")
                    } currentValueLabel: {
                        Text("")
                    } minimumValueLabel: {
                        Text("")
                    } maximumValueLabel: {
                        Text("")
                    }
                    .gaugeStyle(.accessoryLinear)
                    .tint(
                        Gradient(colors: [.blue, .green, .yellow, .red])
                    )
                    
                    if result < 18.5 {
                        Text("Magreza")
                            .font(Font.system(size: 19).bold())
                            .foregroundStyle(.blue)
                    } else if result >= 18.5 && result < 24.9 {
                        Text("Normal")
                            .font(Font.system(size: 19).bold())
                            .foregroundStyle(.green)
                    } else if result >= 25.0 && result < 29.9 {
                        Text("Sobrepeso")
                            .font(Font.system(size: 19).bold())
                            .foregroundStyle(.yellow)
                    } else if result >= 30.0 && result < 39.9 {
                        Text("Obesidade")
                            .font(Font.system(size: 19).bold())
                            .foregroundStyle(.orange)
                    } else {
                        Text("Obesidade Grave")
                            .font(Font.system(size: 19).bold())
                            .foregroundStyle(.red)
                    }
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(11.0)
            }
            
            
            if result < 18.5 {
                Text("Seu IMC está abaixo do peso ideal. É importante considerar uma dieta equilibrada e procurar orientação de um profissional de saúde para evitar problemas relacionados à desnutrição.")
                    .foregroundStyle(Color("darkGray"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .foregroundStyle(.blue)
            } else if result >= 18.5 && result < 24.9 {
                Text("Seu IMC está com o peso saudável. Manter uma dieta balanceada e praticar atividades físicas regularmente são fundamentais para conservar este estado.")
                    .foregroundStyle(Color("darkGray"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .foregroundStyle(.green)
            } else if result >= 25.0 && result < 29.9 {
                Text("Seu IMC está acima do peso ideal. O sobrepeso pode aumentar o risco de desenvolver doenças como hipertensão, diabetes tipo 2 e problemas cardíacos. É recomendável adotar hábitos alimentares saudáveis e aumentar a atividade física.")
                    .foregroundStyle(Color("darkGray"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .foregroundStyle(.yellow)
            } else if result >= 30.0 && result < 39.9 {
                Text("Seu IMC indica obsedidade leve. Esta condição aumenta significativamente o risco de doenças crônicas. Mudanças no estilo de vida, como uma alimentação balanceada e exercícios regulares, são cruciais para reduzir o peso")
                    .foregroundStyle(Color("darkGray"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .foregroundStyle(.orange)
            } else {
                Text("Seu IMC indica obsedidade mórbida (Grave). esta faixa de IMC é associada a um risco muito alto de problemas de saúde graves e comórbidos. Intervenções médicas mais intensivas, incluindo cirurgia bariátrica, podem ser consideradas sob orientação médica.")
                    .foregroundStyle(Color("darkGray"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .foregroundStyle(.red)
            }
            
            Text("@Kaic Cesar")
                .foregroundStyle(.gray)
                .padding(.top, 150)
                
        }
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color("backColor"))
    }
    
    func calc() -> Double {
        guard let height = Double(height), let weight = Double(weight) else {
            return -1.0
        }
        return weight / (height * height)
    }
}



#Preview {
    ResultView(height: "10.0", weight: "10.0")
}
