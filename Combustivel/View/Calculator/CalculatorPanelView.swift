//
//  CalculatorPanelView.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 13/03/21.
//

import SwiftUI

struct CalculatorPanelView: View {
    
    @Binding var gasolineTxtPrice: String
    @Binding var alcoholTxtPrice: String
    var state: MyState
    let update: ()->Void
    
    var body: some View {
        VStack {
            
            HStack(spacing: 16) {
                TextField("Valor", text: $gasolineTxtPrice) { editing in
                    if !editing { update() }
                } onCommit: {
                    update()
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                
                
                TextField("Valor", text: $alcoholTxtPrice) {  editing in
                    if !editing { update() }
                } onCommit: {
                    update()
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            }
            .padding()
            
            
            
            HStack {
                Spacer()
                
                Image(systemName: state == .calculating ? "questionmark.circle.fill" : state == .gasoline ? "hand.thumbsup.fill" : "hand.thumbsdown.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44, alignment: .center)
                    .foregroundColor(state == .calculating ? .yellow : state == .gasoline ? .green : .red)
                    .animation(.easeIn)
                Spacer()
                
                Image(systemName: "speedometer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44, alignment: .center)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Image(systemName: state == .calculating ? "questionmark.circle.fill" : state == .gasoline ? "hand.thumbsdown.fill" : "hand.thumbsup.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44, alignment: .center)
                    .foregroundColor(state == .calculating ? .yellow : state == .gasoline ? .red : .green)
                    .animation(.easeIn)
                
                Spacer()
                
            }
            .padding(.bottom)
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal, 30)
        .padding(.top, 30)
    }
}

struct CalculatorPanelView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(model: CalculatorViewModel())
    }
}
