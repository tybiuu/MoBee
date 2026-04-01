//
//  OnboardingView.swift
//  MoBee
//
//  Created by Tania on 30/03/26.
//

import SwiftUI

enum OnboardingPage: Int, CaseIterable {
    case one, two, three
    
    var title : String {
        switch self {
        case.one: return "Bienvenido a Mobee"
        case.two: return "Descubre miles de títulos"
        case.three: return "Guarda tus favoritos"
        }
    }
    
    var description : String {
        switch self {
        case.one: return "Tu catálogo personal de películas y series favoritas."
        case.two: return "Busca por nombre, género, director o año de estreno."
        case.three: return "Crea tu lista y lleva un registro de lo que has visto."
        }
    }
    
    var image : ImageResource {
        switch self {
        case.one: return .obIcon
        case.two: return .obIcon2
        case.three: return .obIcon3
        }
    }
}

struct OnboardingView: View {
    @State private var currentPage : Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(OnboardingPage.allCases, id: \.rawValue) { page in
                    Page(icon: page.image, title: page.title, description: page.description)
                        .tag(page.rawValue)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.spring(), value: currentPage)
            
            HStack {
                ForEach(0..<OnboardingPage.allCases.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(currentPage == index ? .accentPrimary : .textPrimary)
                        .frame(width: currentPage == index ? 20 : 10, height: 8)
                        .animation(.spring(), value: currentPage)
                }
            }
            
            Button(action: {
                currentPage += 1
            }, label: {
                Text(currentPage < OnboardingPage.allCases.count - 1 ? "Continuar" : "Empezar")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)

                    .background(RoundedRectangle(cornerRadius: 20).fill(.accentPrimary))
                    .padding(.horizontal, 30)
                    .foregroundStyle(.black)
            })
            
            Button("Omitir") {
                currentPage += 1
            }
            .foregroundStyle(.textSecondary)
            
            //            VStack {
            //
            //                .padding(.bottom, 20)
            //
            //                Group {
            //                    Button(action: {
            //                        index += 1
            //                    }, label: {
            //                        Text("Continuar")
            //                            .padding(.vertical, 15)
            //                            .frame(maxWidth: .infinity)
            //                            .background(RoundedRectangle(cornerRadius: 20).fill(.accentPrimary))
            //                            .padding(.horizontal, 30)
            //                            .foregroundStyle(.black)
            //                    })
            //
            //                    Button("Omitir") {
            //                        index += 1
            //                    }
            //                    .foregroundStyle(.textSecondary)
            //                }
            //                .font(.title3)
            //                .fontWeight(.medium)
            //                .padding(.bottom, 15)
            //            }
        }
    }
}

#Preview {
    OnboardingView()
}

