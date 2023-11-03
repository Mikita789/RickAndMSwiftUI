//
//  NetwManager.swift
//  RickAndM
//
//  Created by Никита Попов on 2.11.23.
//

import Foundation


enum NetwMErrors:Error{
    case badURL, parseError, noDataError
}



struct NetwManager{
    
    static let shared = NetwManager()
    private init(){}
    
    private let baseUrl = "https://rickandmortyapi.com/api/"
    private let urlSess = URLSession.shared
    
    private func makeURL(type: EndPointsCatalog, param: String) throws ->URL{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/\(type.rawValue)"
        
        switch type{
        case .charactrers:
            urlComponents.queryItems = [URLQueryItem(name: "name", value: param)]
        }
        
        guard let url = urlComponents.url else { throw NetwMErrors.badURL }
        
        print(url)
        return url
    }
    
    func fetchData(type: EndPointsCatalog, param: String) async throws -> [CharacterModel]{
        let url = try makeURL(type: type, param:param)
        let (result, _ ) = try await urlSess.data(from: url)
        guard let response = try? JSONDecoder().decode(ResultCharactersModel.self, from: result) else { 
            print ("error parse")
            throw NetwMErrors.parseError }
        print(response.results.count)
        var chrArr:[CharacterModel] = []
        response.results.map{ chrArr.append(CharacterModel(item: $0)) }
        
        return chrArr
    }
    
    func fetchStartData(type: EndPointsCatalog) async throws -> [CharacterModel]{
        var idStr:String{
            var id = Set<Int>()
            while id.count < 30{
                let rn = Int.random(in: 0...820)
                id.insert(rn)
            }
            let str = Array(id).map{String($0)}.joined(separator: ",")
            return str
        }
        
        print("https://rickandmortyapi.com/api/character/\(idStr)")
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(idStr)")  else {
            
            throw NetwMErrors.badURL }
        let (res, _) = try await urlSess.data(from: url)
        
        guard let resp = try? JSONDecoder().decode([Result].self, from: res) else { throw NetwMErrors.parseError }
        var chrArr:[CharacterModel] = []
        resp.map{ chrArr.append(CharacterModel(item: $0)) }
        
        return chrArr

    }
    
    
    
    
    enum EndPointsCatalog:String{
        case charactrers = "character/"
        
    }
    
}
