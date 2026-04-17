//
//  HeaderImage.swift
//  MoBee
//
//  Created by Tania on 16/04/26.
//

import SwiftUI

struct HeaderImage: View {
    let featuredMovie: Movie
    
    var body: some View {
        AsyncRectangle(url: featuredMovie.image, width: .infinity, height: 220, cornerRadius: 15)
            .overlay {
                VStack(alignment: .leading, spacing: 0) {
                    Group {
                        Text("NOW PLAYING")
                            .font(.caption)
                            .padding(3)
                            .padding(.horizontal, 8)
                            .background(Capsule().fill(.accentPrimary))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text(featuredMovie.name)
                            .font(.title2)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                            .lineLimit(2)
                    }
                    .fontWeight(.bold)
                    
                    HStack {
                        Group {
                            Text(featuredMovie.year, format: .number.grouping(.never))
                            Text("•")
                            ForEach(featuredMovie.genders.prefix(2), id: \.self) { gender in
                                Text(gender)
                                Text("•")
                            }
                        }
                        .foregroundStyle(.white)
                        
                        HStack(spacing: 3) {
                            Image(systemName: "star.fill")
                            Text(featuredMovie.star, format: .number.precision(.fractionLength(1)))
                        }
                        .foregroundStyle(.accentPrimary)
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 2)
                    .padding(.bottom, 8)
                    HStack {
                        HStack (spacing: 5){
                            Image(systemName: "info.circle")
                            Text("More info")
                        }
                        .font(.subheadline)
                        .padding(8)
                        .padding(.horizontal, 5)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        
                        Text("+ Watchlist")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(8)
                            .padding(.horizontal, 8)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.6)))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
    }
}

#Preview {
    HeaderImage(featuredMovie: .movie)
}
