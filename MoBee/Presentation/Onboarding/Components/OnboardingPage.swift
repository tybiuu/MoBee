//
//  OnboardingPage.swift
//  MoBee
//
//  Created by Tania on 6/04/26.
//


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
    
    var icon : ImageResource {
        switch self {
        case.one: return .obIcon
        case.two: return .obIcon2
        case.three: return .obIcon3
        }
    }
}