//
//  OnboardingView.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 13/03/21.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardingCard(title: "Tela 1")
            
            OnboardingCard(title: "Tela 2")
            
            OnboardingCard(title: "Tela 3")
        }//:TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
