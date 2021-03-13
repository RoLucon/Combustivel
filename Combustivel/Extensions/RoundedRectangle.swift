//
//  RoundedRetangle.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 10/03/21.
//

import SwiftUI

extension RoundedRectangle {
    
    /// Edges are proportional to the size following the corner radius factory scale
    /// - Parameter geometryReader: The GeometryProxy of reference for describing this shape.
    init(GeometryProxy: GeometryProxy) {
        
        let size = GeometryProxy.size
        
        let minor = min(size.width, size.height)
        
        let value = (minor / 2) * RoundedRectangle.cornerRadiusFactorScale
        
        self.init(cornerRadius: value)
    }
    
}


