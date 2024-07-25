//
//  DiceApp.swift
//  ChatPrototype
//
//  Created by Jacob on 7/25/24.
//

import SwiftUI

struct DiceApp: View {
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    numberOfDice += 1
                }
                .disabled(numberOfDice == 5)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .background(Gradient(colors: [.gradientTop, .gradientBottom]))
        .tint(.white)
    }
}

#Preview {
    DiceApp()
}
