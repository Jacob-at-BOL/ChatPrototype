//
//  PickAPal.swift
//  ChatPrototype
//
//  Created by Jacob on 7/25/24.
//

import SwiftUI

struct PickAPal: View {
    @State private var names: [String] = ["Jacob", "Lydia", "John", "Noah", "Elayna", "Stella"]
    @State private var nameToAdd:String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? " " : pickedName)
            
            List {
                ForEach(names, id: \.self) {name in
                    Text(name)
                }
            }
            
            TextField("Add Name", text: $nameToAdd)
                .onSubmit {
                    if !nameToAdd.isEmpty{
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked?", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return (name == randomName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    PickAPal()
}
