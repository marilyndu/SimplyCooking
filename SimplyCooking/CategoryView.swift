//
//  CategoryView.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var categoryVM = CategoriesViewModel()
    var body: some View {
        NavigationStack {
            Text("Select a Category")
                .bold()
                .font(.title)
            VStack {
                List {
                    ForEach(categoryVM.categoriesArray) { category in
                        HStack {
                            Spacer()
                            
                            NavigationLink {
                                MealsListView(selectedCategory: MealsListView.Category(rawValue: category.strCategory) ?? .Beef)
                            } label: {
                                AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .cornerRadius(15)
                                } placeholder: {
                                    Image(systemName: "fork.knife.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150, alignment: .center)
                                }
                            }
                            
                            Text("\(category.strCategory)")
                                .bold()
                                .font(.title)
                                .foregroundColor(Color("salmon"))
                            Spacer()
                        }
                    }
                }
                .listStyle(.grouped)
            }
            .navigationTitle("Select a Category")
            .navigationBarTitleDisplayMode(.large)
        }
        .task {
            await categoryVM.getData()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
