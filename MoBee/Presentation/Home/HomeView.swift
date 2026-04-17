//
//  HomeView.swift
//  MoBee
//
//  Created by Tania on 7/04/26.
//

import SwiftUI

struct HomeView: View {
    let featuredMovie: Movie = .movie
    let trendingMovies: [Movie] = Movie.trending
    let topRatedMovies: [Movie] = Movie.topRated
    let popularTVShows: [Movie] =  Movie.popularTV
    let upcomingMovies: UpcomingMock = Movie.upcoming
    
    @State var trendindSelected: Bool = true
    var body: some View {
        ZStack {
            
            ScrollView (showsIndicators: false) {
                LazyVStack (spacing: 5){
                    Header()
                        .padding(.horizontal)

                    HeaderImage(featuredMovie: featuredMovie)
                        .padding(.bottom, 15)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Trending")
                            .font(.title3)
                        Spacer()
                        Text("See All")
                            .foregroundStyle(.accentPrimary)
                    }
                    .fontWeight(.heavy)
                    .padding(.horizontal)

                    
                    HStack {
                        Group {
                            Text("Movies")
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .background(trendindSelected ? .accentPrimary : .clear)
                                .onTapGesture {
                                    trendindSelected = true
                                }
                                .foregroundStyle(trendindSelected ? .black : .textSecondary)
                            
                            Text("TV Shows")
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .background(trendindSelected ? .clear : .accentPrimary)
                                .onTapGesture {
                                    trendindSelected = false
                                }
                                .foregroundStyle(trendindSelected ? .textSecondary : .backgroundPrimary)
                        }
                        .cornerRadius(10)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    }
                    .padding(3.5)
                    .animation(.easeInOut, value: trendindSelected)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.backgroundSurface2)
                    )
                    .padding(.horizontal)

                    HorizontalMovieList(movies: trendingMovies)
                        .padding(.bottom)
                    HStack {
                        Text("Top Rated Movies")
                            .font(.title3)
                        Spacer()
                        Text("See All")
                            .foregroundStyle(.accentPrimary)
                    }
                    .fontWeight(.heavy)
                    .padding(.horizontal)

                    
                    VerticalMovieList(movies: topRatedMovies)
                        .padding(.horizontal)
                        .padding(.bottom)

                    HStack {
                        Text("Popular on TV")
                            .font(.title3)
                        Spacer()
                        Text("See All")
                            .foregroundStyle(.accentPrimary)
                    }
                    .fontWeight(.heavy)
                    .padding(.horizontal)

                    
                    HorizontalMovieList(movies: popularTVShows)
                        .padding(.bottom)
                    
                    HStack {
                        Text("Coming Soon")
                            .font(.title3)
                        Spacer()
                        Text("See All")
                            .foregroundStyle(.accentPrimary)
                    }
                    .fontWeight(.heavy)
                    .padding(.horizontal)

                    
                    HorizontalMovieList(movies: trendingMovies)
                }
            }
        }
    }
    
}

struct Header: View {
    var body: some View {
        HStack {
            HStack (spacing: 0) {
                Text("Mo")
                    .foregroundStyle(.textPrimary)
                Text("Bee")
                    .foregroundStyle(.accentPrimary)
            }
            Spacer()
        }
        .font(.largeTitle)
        .fontWeight(.heavy)
        
    }
}

#Preview {
    HomeView()
}

struct Movie: Identifiable {
    let id: String
    let name: String
    let year: Int
    let image: String
    let posterImage: String
    let star: Double
    let genders: [String]
    let duration: Int
    
    init(
        id: String,
        name: String,
        year: Int,
        image: String,
        posterImage: String,
        star: Double,
        genders: [String],
        duration: Int
    ) {
        self.id = id
        self.name = name
        self.year = year
        self.image = image
        self.posterImage = posterImage
        self.star = star
        self.genders = genders
        self.duration = duration
    }
}

// MARK: - MOCK DATA

extension Movie {
    
    static let movie: Movie = Movie(
        id: UUID().uuidString,
        name: "Dune: Part Two",
        year: 2024,
        image: "https://image.tmdb.org/t/p/w500//iY2ujEY2m68OTTlPFTiHub9joHS.jpg",
        posterImage: "https://image.tmdb.org/t/p/w500//mIBCtPvKZQlxubxKMeViO2UrP3q.jpg",
        star: 7.5,
        genders: ["Sci-fi", "Adventure", "Drama"],
        duration: 121
    )
    
    static let trending: [Movie] = [
        Movie(
            id: UUID().uuidString,
            name: "Dune: Part Two",
            year: 2024,
            image: "https://image.tmdb.org/t/p/w500/dqK9Hag1054tghRQSqLSfrkvQnA.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500//lxIGYkpvYjLtYtZH684AQft0FhD.jpg",
            star: 9.2,
            genders: ["Sci-fi", "Adventure", "Drama"],
            duration: 121
        ),
        
        Movie(
            id: UUID().uuidString,
            name: "Oppenheimer",
            year: 2023,
            image: "https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2Yz.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/ptpr0kGAckfQkJeJIt8st5dglvd.jpg",
            star: 8.7,
            genders: ["Drama", "History", "Biography"],
            duration: 121
        ),
        
        Movie(
            id: UUID().uuidString,
            name: "The Batman",
            year: 2022,
            image: "https://image.tmdb.org/t/p/w500/b0PlSFdDwbyK0cf5RxwDpaOJQvQ.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
            star: 7.9,
            genders: ["Action", "Crime", "Drama"],
            duration: 121
        )
    ]
    
    static let topRated: [Movie] = [
        Movie(
            id: UUID().uuidString,
            name: "The Godfather",
            year: 1972,
            image: "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
            star: 8.7,
            genders: ["Crime", "Drama"],
            duration: 131
        ),
        
        Movie(
            id: UUID().uuidString,
            name: "The Shawshank Redemption",
            year: 1994,
            image: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
            star: 8.7,
            genders: ["Drama", "Crime"],
            duration: 141
        ),
        
        Movie(
            id: UUID().uuidString,
            name: "Interstellar",
            year: 2014,
            image: "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",
            star: 9.5,
            genders: ["Sci-fi", "Adventure", "Drama"],
            duration: 121
        )
    ]
    
    static let popularTV: [Movie] = [
        Movie(
            id: UUID().uuidString,
            name: "Breaking Bad",
            year: 2008,
            image: "https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/tsRy63Mu5cu8etL1X7ZLyf7UP1M.jpg",
            star: 9.5,
            genders: ["Drama", "Crime", "Thriller"],
            duration: 121
        ),
        
        Movie(
            id: UUID().uuidString,
            name: "Stranger Things",
            year: 2016,
            image: "https://image.tmdb.org/t/p/w500/x2LSRK2Cm7MZhjluni1msVJ3wDF.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg",
            star: 8.6,
            genders: ["Sci-fi", "Horror", "Drama"],
            duration: 131
        ),
        
        Movie(
            id: UUID().uuidString,
            name: "The Last of Us",
            year: 2023,
            image: "https://image.tmdb.org/t/p/w500/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
            posterImage: "https://image.tmdb.org/t/p/w500/dmo6TYuuJgaYinXBPjrgG9mB5od.jpg",
            star: 8.8,
            genders: ["Drama", "Action", "Adventure"],
            duration: 121
        )
    ]
    static let upcoming: UpcomingMock = UpcomingMock(
        minimumDate: "2026-04-15",
        maximumDate: "2026-05-06",
        movies: [
            Movie(
                id: UUID().uuidString, name: "The Super Mario Galaxy Movie",
                year: 2026,
                image: "https://image.tmdb.org/t/p/w500/kxQiIJ4gVcD3K6o14MJ72p5yRcE.jpg",
                posterImage: "https://image.tmdb.org/t/p/w500/eJGWx219ZcEMVQJhAgMiqo8tYY.jpg",
                star: 6.8,
                genders: ["Animation"], duration: 121
                    ),
                    
                    Movie(
                        id: UUID().uuidString, name: "Shelter",
                        year: 2026,
                        image: "https://image.tmdb.org/t/p/w500/nHxWyy18SvAZ8jJeemtS8k1UNjM.jpg",
                        posterImage: "https://image.tmdb.org/t/p/w500/buPFnHZ3xQy6vZEHxbHgL1Pc6CR.jpg",
                        star: 6.78,
                        genders: ["Thriller"], duration: 212
                    ),
                    
                    Movie(
                        id: UUID().uuidString, name: "Future Action Movie",
                        year: 2026,
                        image: "https://image.tmdb.org/t/p/w500/tq3h43fZy0H80vzf47MAY7R9Mxo.jpg",
                        posterImage: "https://image.tmdb.org/t/p/w500/tq3h43fZy0H80vzf47MAY7R9Mxo.jpg",
                        star: 2.3,
                        genders: ["Action"], duration: 121
                    )
                ]
            )
}
struct UpcomingMock {
    let minimumDate: String
    let maximumDate: String
    let movies: [Movie]
}

