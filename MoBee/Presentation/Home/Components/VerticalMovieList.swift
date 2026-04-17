//
//  VerticallMovieList.swift
//  MoBee
//
//  Created by Tania on 16/04/26.
//

import SwiftUI

struct VerticalMovieList: View {
    let movies: [Movie]
    var body: some View {
            LazyVStack(spacing: 15) {
                ForEach(movies.prefix(2), id: \.id) { movie in
                    HStack {
                        AsyncRectangle(url: movie.image, width: 60, height: .infinity, cornerRadius: 15)
                        VStack (alignment: .leading,){
                            Text(movie.name)
                                .lineLimit(2)
                            HStack {
                                Group {
                                    Text(movie.year, format: .number.grouping(.never))
                                    Text("•")
                                    Text(movie.genders.first!)
                                }
                                .foregroundStyle(.pillText)
                            }
                            HStack {
                                ForEach(0..<5) { index in
                                    let fill = max(0, min(1, movie.star/2.rounded(.down) - Double(index)))
                                    StarView(fill: fill)
                                }
                                .frame(maxWidth: 13)
                                
                                Text(movie.star, format: .number.precision(.fractionLength(1)))
                                    .foregroundStyle(.accentPrimary)
                                    .fontWeight(.bold)
                            }
                            .font(.footnote)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Circle().foregroundStyle(.pillBackground)
                            .overlay {
                                Image(systemName: "bookmark")
                                    .foregroundStyle(.accentPrimary)
                                    .bold()

                            }
                            .frame(height: 35)
                    }
                    .padding(.bottom, 5)
                }
            }
            .font(Font.subheadline)
    }
}

#Preview {
    VerticalMovieList(movies: Movie.topRated)
}
