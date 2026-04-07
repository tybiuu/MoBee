//
//  Page.swift
//  MoBee
//
//  Created by Tania on 1/04/26.
//

import SwiftUI

struct Page: View {
    let type: OnboardingPage
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            ZStack {
                if #available(iOS 17.0, *) {
                    Circle().fill(.accentPrimary.opacity(0.05)).stroke(.accentDark.opacity(0.12),lineWidth: 2).frame(width: 375)
                        .scaleEffect(isAnimating ? 1 : 1.1)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                    
                    
                    Circle().fill(.accentPrimary.opacity(0.05)).stroke(.accentDark.opacity(0.17),lineWidth: 2).frame(width: 310)
                        .scaleEffect(isAnimating ? 0.95 : 1)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                    
                    Circle().fill(.accentDark.opacity(0.05)).stroke(.accentDark.opacity(0.2),lineWidth: 2).frame(width: 240)
                        .scaleEffect(isAnimating ? 1 : 0.95)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                } else {
                    Circle().stroke(.accentDark.opacity(0.12),lineWidth: 2).frame(width: 375)
                        .scaleEffect(isAnimating ? 1 : 1.1)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                    Circle().stroke(.accentDark.opacity(0.17),lineWidth: 2).frame(width: 310)
                        .scaleEffect(isAnimating ? 0.95 : 1)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                    Circle().stroke(.accentDark.opacity(0.2),lineWidth: 2).frame(width: 240)
                        .scaleEffect(isAnimating ? 1 : 0.95)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                    
                }
                Circle().fill(.accentDark.opacity(0.1)).frame(width: 170)
                    .scaleEffect(isAnimating ? 1 : 1.1)
                    .animation(.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
                
                Image(type.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .offset(y: isAnimating ? 10 : -5)
                    .animation( type == .one ? .bouncy(duration: 1.5, extraBounce: 0.8).repeatForever() : nil, value: isAnimating)
            }
            
            Group {
                Text(type.title)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(.top)
                    .padding(.bottom, 20)
                
                Text(type.description)
                    .font(.headline)
                
            }
            .padding(.horizontal)
            .opacity(isAnimating ? 1 : 0)
            .animation(.spring(dampingFraction: 0.8).delay(0.3), value: isAnimating)
        }
        .multilineTextAlignment(.center)
        .onAppear {
            isAnimating = true
        }
    }
}


#Preview {
    Page(type: .one)
}

