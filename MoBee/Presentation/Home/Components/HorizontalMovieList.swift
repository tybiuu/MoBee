//
//  HorizontalMovieList.swift
//  MoBee
//
//  Created by Tania on 13/04/26.
//

import SwiftUI

struct HorizontalMovieList: View {
    let movies: [Movie]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                ForEach(movies, id: \.id) { movie in
                    VStack (alignment: .leading, spacing: 0){
                        AsyncRectangle(url: movie.posterImage, width: .infinity, height: 160, cornerRadius: 10, type: .poster)
                        .overlay {
                            VStack {
                                Spacer()
                                HStack(spacing: 3) {
                                    Image(systemName: "star.fill")
                                    Text(movie.star, format: .number.precision(.fractionLength(1)))
                                }
                                .foregroundStyle(.accentPrimary)
                                .font(.caption)
                                .bold()
                                .padding(3)
                                .background(.black.opacity(0.8))
                                .cornerRadius(5)
                                .padding(5)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(.bottom, 6)
                        Group {
                            Text(movie.name)
                            Text(movie.year, format: .number.grouping(.never))
                                .foregroundStyle(.textSecondary)
                        }
                        .font(.footnote)
                        .bold()
                        
                    }
                    
                }
            }
            .padding(.leading)
        }
    }
}

#Preview {
    HorizontalMovieList(movies: Movie.trending)
}
