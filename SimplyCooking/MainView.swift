//
//  MainView.swift
//  SimplyCooking
//
//  Created by Marilyn Du on 12/9/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct MainView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            TabView {
                CategoryView()
                    .tabItem {
                        Text("Recipes")
                    }
                FavoritesView()
                    .tabItem {
                        Text("Favorites")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        do {
                            try Auth.auth().signOut()
                            print("Log out successful")
                            dismiss()
                        } catch {
                            print("ERROR: Could not sign out!")
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
