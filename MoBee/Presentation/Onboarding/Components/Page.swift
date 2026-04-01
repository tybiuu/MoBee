//
//  Page.swift
//  MoBee
//
//  Created by Tania on 1/04/26.
//

import SwiftUI

struct Page: View {
    let icon : ImageResource
    let title : String
    let description : String
    
    var body: some View {
        VStack {
            ZStack {
                if #available(iOS 17.0, *) {
                    Circle().fill(.accentPrimary.opacity(0.05)).stroke(.accentDark.opacity(0.12),lineWidth: 2).frame(width: 375)
                    Circle().fill(.accentPrimary.opacity(0.05)).stroke(.accentDark.opacity(0.17),lineWidth: 2).frame(width: 310)
                    Circle().fill(.accentDark.opacity(0.05)).stroke(.accentDark.opacity(0.2),lineWidth: 2).frame(width: 240)
                    
                } else {
                    Circle().stroke(.accentDark.opacity(0.12),lineWidth: 2).frame(width: 375)
                    Circle().stroke(.accentDark.opacity(0.17),lineWidth: 2).frame(width: 310)
                    Circle().stroke(.accentDark.opacity(0.2),lineWidth: 2).frame(width: 240)
                }
                Circle().fill(.accentDark.opacity(0.1)).frame(width: 170)
                
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
            
            Group {
                Text(title)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(.bottom, 20)
                
                Text(description)
                    .font(.headline)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
        }
        .multilineTextAlignment(.center)
    }
}


#Preview {
    Page(icon: .obIcon, title: "Bienvenido a Mobee", description: "Tu catálogo personal de películas y series favoritas.")
}

