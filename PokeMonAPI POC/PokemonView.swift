//
//  ContentView.swift
//  PokeMonAPI POC
//
//  Created by Guru Mahan on 27/01/23.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    @State var model1 = [Result]()
    @State private var searchText = ""
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.2)
            VStack{
                HStack{
                    Text("POKEMON")
                        .font(.largeTitle)
                        .italic()
                }.frame(height: 50)
                NavigationStack{
                    List{ 
                        ForEach(0..<(filteredPokemonName.count),id: \.self) { index in
                          
                            PokemonInnerApiDataView(model: filteredPokemonName[index])
                        }
                    }
                }.searchable(text: $searchText,prompt: "Search Pokemon Name")
            }
        }
    }
    
 var filteredPokemonName:[PokemonInnerDataModel] {
        if searchText.isEmpty{
            return viewModel.filterDataList.sorted(by: {$0.id < $1.id})
            
        }else{

            return filterfunc(value: viewModel.filterDataList )
        }
    }
    func filterfunc(value:[PokemonInnerDataModel]) -> [PokemonInnerDataModel] {
        return viewModel.filterDataList.filter({"\($0.id)".lowercased().contains(searchText.lowercased()) || (($0.name?.lowercased().contains(searchText.lowercased())) ?? false)})
    }
}

struct PokemonInnerApiDataView: View{
    @State var selectedFile = false
    var model: PokemonInnerDataModel?
   
    var body: some View{
        ZStack{
            questionsView()
                .onTapGesture {
                    selectedFile = true
                }
        }
    }
    
    @ViewBuilder func questionsView() -> some View{
        ZStack {
            LazyVStack(alignment:.leading,spacing: 5){
                  imageView
                HStack{
                    Text("ID: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(model?.id ??  0)")
                }
                HStack{
                    Text("Name: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(model?.name ??  "")")
                }
                HStack{
                    Text("BaseExperience:")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(model?.baseExperience ?? 0)")
                }
                HStack{
                    Text("Height: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(model?.height ??  0)")
                }
                HStack{
                    Text("Weight: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(model?.weight ??  0)")
                }
        }
            Spacer()
        }
        .sheet(isPresented:$selectedFile ) {
            PokemonListDetailsView(model: model)
        }
    }
    
    @ViewBuilder var imageView: some View{
        HStack{
            TabView {
                
                //MARK: ->backDefaultImage
                AsyncImage(
                    url: URL(string: model?.sprites.backDefault ?? ""),
                    content: { image in
                        image.resizable()
                            . frame(width:150,height: 130)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: 250)
                
                //MARK: ->backShinyImage
                AsyncImage(
                    url: URL(string: model?.sprites.backShiny ?? ""),
                    content: { image in
                        image.resizable()
                            . frame(width:130,height: 130)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).frame(width: 250)
                
                //MARK: ->frontDefaultImage
                AsyncImage(
                    url: URL(string: model?.sprites.frontDefault ?? ""),
                    content: { image in
                        image.resizable()
                            . frame(width:150,height: 130)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).frame(width: 250)
                
                //MARK: ->frontShinyImage
                AsyncImage(
                    url: URL(string: model?.sprites.frontShiny ?? ""),
                    content: { image in
                        image.resizable()
                            . frame(width:150,height: 130)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                ).frame(width: 250)
            }.tabViewStyle(.page(indexDisplayMode: .never))
                .frame( height: 200)
                .background(Color.gray.opacity(0.1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}

