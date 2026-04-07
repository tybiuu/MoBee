//
//  ContentView.swift
//  MoBee
//
//  Created by Tania on 26/03/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    
    var body: some View {
        if isOnboardingCompleted {
            HomeView()
        } else {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
}
