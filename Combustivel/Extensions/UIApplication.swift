//
//  UIApplication.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 13/03/21.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
