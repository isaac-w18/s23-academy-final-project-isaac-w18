//
//  HomeView.swift
//  Bibley
//
//  Created by Isaac Frank on 4/5/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        let print = print("HomeView ran")
        NavigationStack {
            NavigationLink {
                BibleView()
            } label: {
                Text("Bible View")
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
