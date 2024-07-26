//
//  FriendsApp.swift
//  ChatPrototype
//
//  Created by jacob simpson on 7/26/24.
//

import SwiftUI
import SwiftData

struct FriendsApp: View {
    @State private var friends: [Friend] = [
        Friend(name: "John Doe", birthday: .now),
        Friend(name: "Jane Doe", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    @State private var newName: String = ""
    @State private var newDate: Date = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        friends.append(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
            }
            .padding()
            .background(.bar)
        }
    }
}

#Preview {
    FriendsApp()
        .modelContainer(for: Friend.self, inMemory: true)
}
