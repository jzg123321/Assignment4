//
//  File.swift
//  Assignment3app
//
//  Created by Josh Guiang on 3/31/24.
//

import SwiftUI


struct RecipeView: View {
    var recipe: Recipe

    var body: some View {
        
        VStack {
            
    
            if let url = URL(string: recipe.image), let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            }

          
            Text(recipe.title)
                .font(.title)

       
            Text("Used ingredients: \(recipe.usedIngredientCount)")
                .font(.title2)
        }
        .padding()
        .navigationTitle(recipe.title)
    }
}




    

