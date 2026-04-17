//
//  StarView.swift
//  MoBee
//
//  Created by Tania on 13/04/26.
//

import SwiftUI

struct StarView: View {
    let fill: Double

    var body: some View {
        ZStack(alignment: .leading) {
            Image(systemName: "star")
                .foregroundColor(.clear)

            Image(systemName: "star.fill")
                .foregroundColor(.accentPrimary)
                .mask(
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: geo.size.width * fill)
                    }
                )
        }
    }
}

#Preview {
    HStack {
        ForEach(0..<5) { index in
            let fill = max(0, min(1, 1.6 - Double(index)))
            StarView(fill: fill)
        }
    }
}
