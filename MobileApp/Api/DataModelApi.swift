//
//  DataModelApi.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 31/03/2021.
//

import SwiftUI



class Api {

    func getFestival(toto: @escaping (Festival) -> ()) {
            print("enterring get Festival")
            guard let url = URL(string: "https://olympiade-des-jeux.herokuapp.com/api/festivals/current") else {
                print("error il n'a pas charger lurl")
                return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { fatalError("il a craché")}
                print(data)
                let festival = try! JSONDecoder().decode(Festival.self, from: data)
                
                DispatchQueue.main.async {
                    toto(festival)
                }
                
            }
            .resume()
    }
    
    func getGames(completion: @escaping ([GameView]) -> ()) {
            
            guard let url = URL(string: "https://olympiade-des-jeux.herokuapp.com/api/festivals/games") else {
                return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { fatalError("il a craché")}
                print(data)
                let gamesView = try! JSONDecoder().decode([GameView].self, from: data)
                DispatchQueue.main.async {
                    completion(gamesView)
                }
                
            }
            .resume()
    }
    
    func getEditors(completion: @escaping ([Editor]) -> ()) {

            guard let url = URL(string: "https://olympiade-des-jeux.herokuapp.com/api/festivals/editors") else {
                return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { fatalError("il a craché")}
                print(data)
                let editors = try! JSONDecoder().decode([Editor].self, from: data)
                DispatchQueue.main.async {
                    completion(editors)
                }

            }
            .resume()
    }

    func getExposants(completion: @escaping ([Exposant]) -> ()) {
            
            guard let url = URL(string: "https://olympiade-des-jeux.herokuapp.com/api/festivals/exhibitors") else {
                return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { fatalError("il a craché")}
                print(data)
                let exposants = try! JSONDecoder().decode([Exposant].self, from: data)
                DispatchQueue.main.async {
                    completion(exposants)
                }
                
            }
            .resume()
    }
    
    
    func getZones(completion: @escaping ([Zone]) -> ()) {
            
            guard let url = URL(string: "https://olympiade-des-jeux.herokuapp.com/api/festivals/zones") else {
                return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { fatalError("il a craché")}
                print(data)
                let zones = try! JSONDecoder().decode([Zone].self, from: data)
                DispatchQueue.main.async {
                    completion(zones)
                }
                
            }
            .resume()
    }

}


