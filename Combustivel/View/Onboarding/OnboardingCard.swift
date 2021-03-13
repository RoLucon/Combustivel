//
//  OnboadingCard.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 13/03/21.
//

import SwiftUI

struct OnboardingCard: View {
    
    let title: String
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.blue)
                
                VStack {
                    
                    Text(title)
                        .font(.title)
                    
                }//: Vtack
                
            }//: Ztack
            
        }//: GeometryReader
        .padding(.horizontal)
        
    }//: Body
}

struct OnboadingCard_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCard(title: "Preview")
    }
}
