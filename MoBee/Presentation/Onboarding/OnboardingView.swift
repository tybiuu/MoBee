//
//  OnboardingView.swift
//  MoBee
//
//  Created by Tania on 30/03/26.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    @State private var currentPage : Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(OnboardingPage.allCases, id: \.rawValue) { page in
                    Page(type: page)
                        .tag(page.rawValue)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.spring(), value: currentPage)
            
            HStack {
                ForEach(0..<OnboardingPage.allCases.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(currentPage == index ? .accentPrimary : .textPrimary)
                        .frame(width: currentPage == index ? 20 : 10, height: 8)
                        .animation(.spring(), value: currentPage)
                }
            }
            
            Button(action: {
                if currentPage < OnboardingPage.allCases.count - 1 {
                    currentPage += 1
                } else {
                    isOnboardingCompleted = true
                    print(isOnboardingCompleted)
                }
            }, label: {
                Text(currentPage < OnboardingPage.allCases.count - 1 ? "Continuar" : "Empezar")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.accentPrimary))
            })
            .padding(.horizontal, 30)
            .foregroundStyle(.black)
            .padding(.vertical)
            
            Button(action: {
                isOnboardingCompleted = true
                print(isOnboardingCompleted)
            }, label: {
                Text(currentPage < OnboardingPage.allCases.count - 1 ? "Omitir" : "")
                    .foregroundStyle(.textSecondary)
                    .fontWeight(.semibold)
                    .frame(minHeight: 20)
                
            })
            .padding(.bottom)
        }
    }
}

#Preview {
    OnboardingView()
}

