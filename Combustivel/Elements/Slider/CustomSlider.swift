//
//  Slider.swift
//  Combustivel
//
//  Created by Rogerio Lucon on 10/03/21.
//

import SwiftUI

struct CustomSlider: View {
    
    
    @Binding var value: CGFloat
    @State var percentage: Float
    let bounds: ClosedRange<Int>
    let title: String
    
    init(title: String, value: Binding<CGFloat>, in bounds: ClosedRange<Int>) {
        self.title = title
        
        _value = value
        self.bounds = bounds
        
        let dif: Float = Float(abs(bounds.min()! - (bounds.max()! )))
        
        let aux: Float = Float(value.wrappedValue) / dif
        
        _percentage = State(initialValue: aux)
    }
    
    var body: some View {
        let formatter = NumberFormatter()
        
        var text: Binding<String> {
            Binding<String>(
                get: { String(format: "R$: %.2f", value)},
                set: {
                    var number = $0.components(separatedBy: CharacterSet.letters).joined()
                    number = number.components(separatedBy: CharacterSet.symbols).joined()
                    number = number.components(separatedBy: .init(charactersIn: ":")).joined()
                    print(number)
                    if let value = formatter.number(from: number) {
                        self.value = CGFloat(value.floatValue)
                    }
                }
            )
        }
        
       return VStack {
        
        Text(title)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
        TextField("Valor", text: text) { isEditing in
            
        } onCommit: {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Call"), object: (Any).self)
        }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .keyboardType(.decimalPad)
                .font(.title2)
                .padding()
            
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
                            self.percentage = min(max(0, 1 - Float(value.location.y / geometry.size.height)), 1)
                            adjustValue()
                        }))
                    .onReceive(NotificationCenter.default.publisher(for: .init("Call")), perform: { _ in
                        let dif: Float = Float(abs(bounds.min()! - (bounds.max()! )))
                        
                        self.percentage = Float(value) / dif
                    })
                }
                .clipShape(RoundedRectangle(GeometryProxy: geoProxy))
                .padding(.horizontal)
            }
        }
    }
    
    func adjustValue() {
        let min = bounds.min() ?? 00
        let max = bounds.max() ?? 00
        
        let dif: Float = Float(max - min)
        
        value = CGFloat((dif) * percentage) + CGFloat(min)
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}


