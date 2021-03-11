//
//  CalculatorView.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 10/03/21.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var valueOne: CGFloat = 10
    @State var valueTwo: CGFloat = 10
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    VStack {

                        Spacer()
                        
                        HStack {
                            CustomSlider(title: "Gasolina",value: $valueOne, in: 1...15)
                                .accentColor(.green)
                            
                            CustomSlider(title: "Álcool",value: $valueTwo, in: 1...15)
                                .accentColor(.yellow)
                        }
                        .padding()
                        
                        Spacer()
                    }
                    .zIndex(1.0)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(GeometryProxy: geometry))
                    .padding(30)
                    .navigationTitle("Calculadora")
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 60)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)
            }
        }
    }
    
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}


