//
//  File1.swift
//  Assignment3app
//
//  Created by Josh Guiang on 3/31/24.
//

import SwiftUI

struct MainInputView: View {
    
    @State private var ingredients = ""
    
    @ObservedObject var viewModel = RecipeViewModel()

    var body: some View {
        VStack {
            Text("Find Recipes using Ingredients")
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
            
            TextField("Ingredient", text: $ingredients)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Image("Image")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 125, height: 125)
                .padding()
            
            Button(action: {
                viewModel.fetchRecipes(ingredients: ingredients)
            }) {
                Text("FIND")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red) 
                    .cornerRadius(10)
            }
            
          
            
            List(viewModel.recipes) { recipe in
                NavigationLink(destination: RecipeView(recipe: recipe)) {
                    HStack {
                        Text(recipe.title)
                        Spacer()
                        Text("\(recipe.usedIngredientCount) Ingredients Used")
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Recipes")
        .background(Color.blue)
    }
}


