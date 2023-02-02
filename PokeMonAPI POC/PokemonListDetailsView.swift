//
//  PokemonListDetailsView.swift
//  PokeMonAPI POC
//
//  Created by Guru Mahan on 30/01/23.
//

import SwiftUI

struct PokemonListDetailsView: View {
    
    @State var firstbutton: Bool = true
    @State var secondbutton: Bool = false
    @State var thirdbutton: Bool = true
    @State var fourthbutton: Bool = false
    @State private var favoriteColor = 0
    var model: PokemonInnerDataModel?
    
    var body: some View {
        ZStack{
            
            
            VStack{
             
                    tapControllerButtonView
              
              Spacer()
                VStack(spacing: 10){
                    
                    
                  
                        imageView
                 
                    
                    Spacer()
                    VStack(alignment: .leading){
                        
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
                            //  .font(.largeTitle)
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
                }.padding()
              
            }
           
        }
    }

    @ViewBuilder var tapControllerButtonView: some View{
        VStack(spacing: 8){
            
            HStack(spacing: 0){
                Button {
                    
                    withAnimation {
                        //  firstbutton.toggle()
                          firstbutton = true
                          secondbutton = false
                    }
                 
                
                } label: {
                    backButtonView
                        .frame(maxWidth: .infinity)
                       
                }
                .frame(height: 25)
                .background(firstbutton ? Color.blue : Color.white)
                .overlay(Rectangle()
                .stroke(Color.blue, lineWidth: 2))
                .foregroundColor(Color.blue)
                
                
            
                Button {
                    withAnimation {
                        //   secondbutton.toggle()
                           secondbutton = true
                           firstbutton = false
                    }
               
                } label: {
                    frontButtonView
                        .frame(maxWidth: .infinity)
                    
                      
                }
                .frame(height: 25)
                .background(secondbutton ? Color.blue : Color.white)
                .overlay(Rectangle()
                    .stroke(Color.blue, lineWidth: 2))
                    .foregroundColor(Color.blue)
              
            }
            
            HStack(spacing: 0){
                Button {
                    withAnimation {
                        //  thirdbutton.toggle()
                          thirdbutton = true
                          fourthbutton = false
                    }
                
                    
                } label: {
                    defaultButtonView
                        .frame(maxWidth: .infinity)
                       
                    
                }
                .frame(height: 25)
                .background(thirdbutton ? Color.blue : Color.white)
                .overlay(Rectangle()
                    .stroke(Color.blue, lineWidth: 2))
                    .foregroundColor(Color.blue)
                
                
                Button {
                    withAnimation {
                        //   fourthbutton.toggle()
                        thirdbutton = false
                        fourthbutton = true
                    }
              
                  
                } label: {
                    shinyButtonView
                        .frame(maxWidth: .infinity)
                       
                }
                .frame(height: 25)
                .background(fourthbutton ? Color.blue : Color.white)
                .overlay(Rectangle()
                    .stroke(Color.blue, lineWidth: 2))
                    .foregroundColor(Color.blue)
               
            }


        }
        .padding()
        
    }
    
    
    
    
        @ViewBuilder var backButtonView: some View{
            
           
                Text("Back")
                    .font(Font.system(size: 15))
                    .foregroundColor(firstbutton ? Color.white : Color.black )
                    .fontWeight(.bold)
        
        }
    
    //MARK: ->toStartButtonView
    @ViewBuilder var frontButtonView: some View{
       
            Text("Front")
                .foregroundColor(secondbutton ? Color.white : Color.black )
                .font(Font.system(size: 15))
                .fontWeight(.bold)
     }
  
    //MARK: ->inProgressButtonView

    @ViewBuilder var defaultButtonView: some View{
    
            Text("Default")
               // .foregroundColor(Color(uiColor: .black))
                .font(Font.system(size: 15))
                .foregroundColor(thirdbutton ? Color.white : Color.black )
                .fontWeight(.bold)
     
        
     }
   
    //MARK: ->allButtonView
    @ViewBuilder var shinyButtonView: some View{
   
            Text("Shiny")
                .foregroundColor(fourthbutton ? Color.white : Color.black )
                .font(Font.system(size: 15))
                .fontWeight(.bold)
    
     }
    
    
    @ViewBuilder var imageView: some View{
        VStack{
          
            if firstbutton && thirdbutton {
                withAnimation {
                    AsyncImage(
                        url: URL(string: model?.sprites.backDefault ?? ""),
                        content: { image in
                            image.resizable()
                                .frame(width: 200,height: 300)
                                .aspectRatio(contentMode: .fit)
                 
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }

            }
                
            if firstbutton && fourthbutton {
                withAnimation {
                    AsyncImage(
                        url: URL(string: model?.sprites.backShiny ?? ""),
                        content: { image in
                            image.resizable()
                                .frame(width: 200,height: 300)
                                .aspectRatio(contentMode: .fit)
                      
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }

            }
            if  secondbutton && thirdbutton {
                withAnimation {
                    AsyncImage(
                        url: URL(string: model?.sprites.frontDefault ?? ""),
                        content: { image in
                            image.resizable()
                                .frame(width: 200,height: 300)
                                .aspectRatio(contentMode: .fit)

                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }

            }
            
            if secondbutton && fourthbutton{
                withAnimation {
                    AsyncImage(
                        url: URL(string: model?.sprites.frontShiny ?? ""),
                        content: { image in
                            image.resizable()
                                .frame(width: 200,height: 300)
                                .aspectRatio(contentMode: .fit)
                            
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }

            }
 
        }
    }
}

struct PokemonListDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListDetailsView()
    }
}


//SegmentController

//VStack {
//    Picker("What is your favorite color?", selection: $favoriteColor) {
//        Text("back").tag(0)
//        Text("front").tag(1)
//
//    }
//    .pickerStyle(.segmented)
//    Picker("What is your favorite color?", selection: $favoriteColor) {
//        Text("Default").tag(0)
//        Text("Shiny").tag(3)
//
//    }
//    .pickerStyle(.segmented)
//
//}
