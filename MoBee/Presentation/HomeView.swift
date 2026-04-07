//
//  HomeView.swift
//  MoBee
//
//  Created by Tania on 7/04/26.
//

import SwiftUI

struct HomeView: View {
    let moviedestacada: Movie = .movie
    var body: some View {
        AsyncImage(url: URL(string: moviedestacada.image )) { image in
            image.resizable()
                .aspectRatio(16/9, contentMode: .fit)
                .cornerRadius(20)
                .shadow(color: .black, radius: 1)
                .opacity(0.1)
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: 240)
        .overlay {
            VStack (alignment: .leading, spacing: 0){
                Spacer()
                Text("DESTACADA")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(3)
                    .padding(.horizontal, 8)

                    .background(Capsule().fill(.accentPrimary))
                
                
                Text(moviedestacada.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    Text("\(moviedestacada.year)")
                    Text(moviedestacada.star.isZero ? "N/A" : "")
                    Text("\(moviedestacada.star)")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
    }
}

#Preview {
    HomeView()
}

struct Movie {
    let name: String
    let year: Int
    let image: String
    let star: Float
    
    static let movie: Movie = Movie(name: "Dune: Part Two", year: 2024, image: "https://ethic.es/wp-content/uploads/2023/03/imagen.jpg", star: 8.4)
}
