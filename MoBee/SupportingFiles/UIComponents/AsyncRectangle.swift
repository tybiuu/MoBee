//
//  AsyncRectangle.swift
//  MoBee
//
//  Created by Tania on 13/04/26.
//

import SwiftUI

struct AsyncRectangle: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let type: ImageType
    
    init(url: String, width: CGFloat, height: CGFloat, cornerRadius: CGFloat = 0, type: ImageType = .defaultImage) {
        self.url = url
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.type = type
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFit()
                .clipped()
                .overlay(
                    LinearGradient(
                        colors: type.colors,
                        startPoint: type.startPoint, endPoint: type.endPoint)
                )
        } placeholder: {
            Rectangle()
                .fill(.textPrimary)
                .overlay {
                    ProgressView()
                        .tint(.gray)
                }
        }
        .cornerRadius(cornerRadius)
        .frame(maxWidth: width)
        .frame(height: height)

    }
}

enum ImageType {
    case backdrop
    case poster
    case defaultImage
    
    var colors: [Color] {
        switch self {
        case .backdrop:
            [Color.black.opacity(1),Color.black.opacity(0.6),Color.clear,Color.clear]
        case . poster:
            [Color.black.opacity(0.8), Color.clear, Color.clear]
        case .defaultImage:
            []
        }
    }
    
    var startPoint: UnitPoint {
        switch self {
        case .backdrop:
                .bottomLeading
        case .poster:
                .bottom
        case .defaultImage:
                .bottom
        }
    }
    var endPoint: UnitPoint {
        switch self {
        case .backdrop:
                .topTrailing
        case .poster:
                .top
        case .defaultImage:
                .bottom
        }
    }
}

#Preview {
    AsyncRectangle(url: "https://image.tmdb.org/t/p/w500/dqK9Hag1054tghRQSqLSfrkvQnA.jpg", width: 200, height: 600)
}
