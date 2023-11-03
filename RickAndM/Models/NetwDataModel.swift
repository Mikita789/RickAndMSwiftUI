//
//  NetwDataModel.swift
//  RickAndM
//
//  Created by Никита Попов on 2.11.23.
//


import Foundation

// MARK: - DataModel
struct ResultCharactersModel: Codable {
    let results: [Result]
}


// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case male = "Male"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case cronenberg = "Cronenberg"
    case human = "Human"
    case humanoid = "Humanoid"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum TypeEnum: String, Codable {
    case empty = ""
    case fishPerson = "Fish-Person"
    case humanWithAntennae = "Human with antennae"
    case robot = "Robot"
}


