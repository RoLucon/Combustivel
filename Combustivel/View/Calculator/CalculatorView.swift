//
//  CalculatorView.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 10/03/21.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var model = CalculatorViewModel()
    var state: MyState { model.isCalculating ? .calculating : model.isAlcohol ? .alcohol : .gasoline}
    
    var body: some View {
        let gasolineBinding = Binding<String>(get: { () -> String in
                    return String(format: "R$: %.2f", self.model.gasolinePrice)
                }) { (s) in
                    var s = s
                    s.removeAll { (c) -> Bool in
                        !c.isNumber
                    }
                    self.model.gasolineTxt = s
        }
        
        let alcoholBinding = Binding<String>(get: { () -> String in
                    return String(format: "R$: %.2f", self.model.alcoholPrice)
                }) { (s) in
                    var s = s
                    s.removeAll { (c) -> Bool in
                        !c.isNumber
                    }
                    self.model.alcoholTxt = s
        }
        
        return GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack {
                    
                    CalculatorPanelView(gasolineTxtPrice: gasolineBinding, alcoholTxtPrice: alcoholBinding, state: state) {
                        model.updateSlider()
                    }
                    
                    HStack {
                        CustomSlider(percentage: $model.gasolineSlider)
                            .onChange(of: model.gasolineSlider, perform: { value in
                                model.updateText()
                            })
                            .accentColor(.green)
                            
                        
                        CustomSlider(percentage: $model.alcoholSlider)
                            .onChange(of: model.alcoholSlider, perform: { value in
                                model.updateText()
                            })
                            .accentColor(.yellow)
                    }
                    .padding()
                    .padding(.bottom)
                    
                }
                .zIndex(1.0)
                .background(Color.blue)
                .clipShape(RoundedRectangle(GeometryProxy: geometry))
                .padding(30)
                .navigationTitle("Calculadora")
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(height: 60)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
        }
        
    }
    
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(model: CalculatorViewModel())
    }
}



