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
        guard let url = URL(string: "http://127.0.0.1:5000/api/festivals/current") else {
            print("error il n'a pas charger lurl")
            return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { fatalError("il a craché")}
            print(data)
            let festival = try! JSONDecoder().decode(Festival.self, from: data)
            print(festival)
            DispatchQueue.main.async {
                toto(festival)
            }
            
        }
        .resume()
    }
}


