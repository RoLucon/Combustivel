//
//  ContentView.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 10/03/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        CalculatorView()
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.context)
    }
}
