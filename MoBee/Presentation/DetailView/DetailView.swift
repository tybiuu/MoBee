//
//  DetailView.swift
//  MoBee
//
//  Created by Tania on 16/04/26.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncRectangle(url: movie.image, width: .infinity, height: .infinity, type: .poster)
                    .overlay {
                        VStack {
                            Spacer()
                            Text(movie.name)
                                .font(.largeTitle.weight(.heavy))
                                .lineLimit(2)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                HStack {
                    Text(movie.year, format: .number.grouping(.never))
                    
                    let duration = minutesToHoursMinutes(movie.duration)
                    Text("\(duration.hours)h \(duration.minutes)min")
                    
                    HStack(spacing: 3) {
                        Image(systemName: "star.fill")
                        Text(movie.star, format: .number.precision(.fractionLength(1)))
                    }
                    .foregroundStyle(.accentPrimary)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(movie.genders, id: \.self) { genre in
                            Text(genre)
                                .font(.caption)
                                .padding(5)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
    }
    
    private func minutesToHoursMinutes(_ minutes: Int) -> (hours: Int, minutes: Int) {
        let hours = minutes / 60
        let minutes = minutes.remainderReportingOverflow(dividingBy: 60).partialValue
        return (hours, minutes)
    }
}

#Preview {
    DetailView(movie: .movie)
}
