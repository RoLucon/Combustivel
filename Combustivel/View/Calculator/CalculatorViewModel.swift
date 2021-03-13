//
//  CalculatorViewModel.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 13/03/21.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var gasolineTxt = "1000"
    @Published var gasolineSlider: Double = 1
    
    @Published var alcoholTxt = "1000"
    @Published var alcoholSlider: Double = 1
    
    var gasolinePrice: Double {
        (Double(self.gasolineTxt) ?? 0.0) / 100
    }
    
    var alcoholPrice: Double {
        (Double(self.alcoholTxt) ?? 0.0) / 100
    }
    
    var isAlcohol: Bool {
        (alcoholPrice / gasolinePrice) < 0.7
    }
    
    @Published var isCalculating: Bool = false
    
    func updateSlider() {
        withAnimation {
            gasolineSlider = gasolinePrice / 10
            alcoholSlider = alcoholPrice / 10
        }
        calculate()
    }
    
    func updateText() {
        gasolineTxt = String(format: "%.2f", 1000 * gasolineSlider)
        alcoholTxt = String(format: "%.2f", 1000 * alcoholSlider)
        calculate()
    }
    
    private func calculate() {
        withAnimation {
            isCalculating = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isCalculating = false
        }
    }
}

enum MyState {
    case gasoline, alcohol, calculating
}
