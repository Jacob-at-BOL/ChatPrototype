//
//  FeaturesPage.swift
//  ChatPrototype
//
//  Created by Jacob on 7/25/24.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(iconName: "person.circle", description: "Manage the information about yourself")
            
            FeatureCard(iconName: "basket", description: "Stuff")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
}
