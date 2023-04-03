//
//  PokemonViewModel.swift
//  PokeMonAPI POC
//
//  Created by Guru Mahan on 27/01/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var dataList : PokemonModel?
    
    init() {
        pokemonApiDecoder()
        }
    func pokemonApiDecoder(){
        
        let urlString =  "https://pokeapi.co/api/v2/pokemon?limit=100&offset=0"
        let url = URL(string: urlString)
        if let url = url {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    do {
                        let decoder = JSONDecoder()
                        if let dat = data{
                            let result = try decoder.decode( PokemonModel.self, from: dat)
                            for value in result.results{
                                self.loadInnerData(url: value.url)
                                print(value.url)
                            }
                            print(result)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            dataTask.resume()
        }
        
        
    }
    
    
    @Published var innerDataList : PokemonInnerDataModel?
    @Published var filterDataList: [PokemonInnerDataModel] = []
   
    func loadInnerData(url: String){
      //  let index = pokemonInnerDataList?.results.count ?? 0
        let urlString =  url
        print(urlString)
        let url = URL(string: urlString)
        
        if let url = url {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    do {
                        let decoder = JSONDecoder()
                        if let dat = data{
                            let result = try decoder.decode( PokemonInnerDataModel.self, from: dat)
                            print(result)
                            DispatchQueue.main.async {
                           
                                self.innerDataList = result
                            //  self.filterDataList = [result]
                              self.filterDataList.append(result)
                                print(self.filterDataList )
                                //print(self.innerDataList ?? [])
                            }
                        }
                      
                    } catch {
                        print(error)
                    }
                }
            }
            dataTask.resume()
        }
        
        
    }
    
}
  
//MARK: -> loadMockDataExtension
//extension PokemonViewModel {
//    static func loadMockData() -> PokemonModel? {
//        let decoder = JSONDecoder()
//        let jsonString = """
//            {
//              "count": 1279,
//              "next": "https://pokeapi.co/api/v2/pokemon?offset=100&limit=100",
//              "previous": null,
//              "results": [
//                {
//                  "name": "bulbasaur",
//                  "url": "https://pokeapi.co/api/v2/pokemon/1/"
//                },
//                {
//                  "name": "ivysaur",
//                  "url": "https://pokeapi.co/api/v2/pokemon/2/"
//                }
//
//              ]
//            }
//            """
//
//        let jsonData = Data(jsonString.utf8)
//        do {
//            let pokemonModel = try decoder.decode(PokemonModel.self, from: jsonData)
//            print(pokemonModel)
//            return pokemonModel
//        } catch DecodingError.keyNotFound(let key, let context) {
//            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
//        } catch DecodingError.valueNotFound(let type, let context) {
//            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
//        } catch DecodingError.typeMismatch(let type, let context) {
//            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
//        } catch DecodingError.dataCorrupted(let context) {
//            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
//        } catch let error as NSError {
//            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
//        }
//        return nil
//    }
//}


