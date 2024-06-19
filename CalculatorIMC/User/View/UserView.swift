//
//  UserView.swift
//  CalculatorIMC
//
//  Created by Kaic Cesar on 18/06/24.
//

import SwiftUI

struct UserView: View {
    
    @State var gender = Gender.male
    @State var name: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading) {
                    Text("Calculadora de IMC")
                        .font(Font.system(.title).bold())
                        .foregroundStyle(Color("PrimaryColor"))
                        .padding(.top, 70)
                        .padding(.bottom, 20)
                    
                    
                    Text("IMC é a sigla para Índice de Massa Corpórea, parâmetro adotado pela Organização Mundial de Saúde para calcular o peso ideal de cada pessoa")
                        .foregroundStyle(Color("darkGray"))
                        .font(Font.system(size: 15))
                        .padding(.bottom, 50)
                    
                    Text("INFORME SEU NOME")
                        .font(Font.system(size: 12))
                        .foregroundStyle(Color("darkGray"))
                        .padding(.bottom, 1)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    TextField("",text: $name)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 5)
                        .foregroundStyle(.black)
                        .background(Color("PrimaryColor").opacity(0.3))
                        .cornerRadius(8.0)
                    
                    Text("INFORME SEU SEXO:")
                        .padding(.top, 20)
                        .font(Font.system(size: 12))
                        .foregroundStyle(Color("darkGray"))
                        .padding(.bottom, -4)
                    
                    Picker("Gender", selection: $gender){
                        ForEach(Gender.allCases, id: \.self) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    .colorMultiply(Color("PrimaryColor").opacity(0.8))
                    .cornerRadius(8.0)
                    .padding(.bottom, 30)
                    
                    if name == "" || name.count < 3 {
                        NavigationLink {
                            HomeView(name: name)
                        } label: {
                            Text("Continuar")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .font(Font.system(size: 17).bold())
                        .foregroundStyle(.white)
                        .background(Color("PrimaryColor"))
                        .opacity(0.5)
                        .cornerRadius(8.0)
                        .padding(.top, 35)
                        .disabled(true)
                    } else {
                        NavigationLink {
                            HomeView(name: name)
                        } label: {
                            Text("Calcular")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .font(Font.system(size: 17).bold())
                        .foregroundStyle(.white)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(8.0)
                        .padding(.top, 35)
                    }
                    
                }
                .padding(.horizontal, 15)
            }
        }
    }
}


#Preview {
    UserView()
}

