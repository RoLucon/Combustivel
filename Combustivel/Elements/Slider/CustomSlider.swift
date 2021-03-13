//
//  Slider.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 10/03/21.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var percentage: Double
    
    var body: some View {
        GeometryReader { geoProxy in
            
            GeometryReader { geometry in
                
                ZStack(alignment: .bottom) {
                    
                    RoundedRectangle(GeometryProxy: geometry)
                        .foregroundColor(.secondary)
                    
                    RoundedRectangle(GeometryProxy: geometry)
                        .foregroundColor(.accentColor)
                        .frame(height: geometry.size.height * CGFloat(percentage), alignment: .bottom)
                }
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged({ value in
                                self.percentage = Double(min(max(0, 1 - Float(value.location.y / geometry.size.height)), 1))
                            }))
            }
            .clipShape(RoundedRectangle(GeometryProxy: geoProxy))
            .padding(.horizontal)
        }
    }
    
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(percentage: .constant(0.8))
    }
}

