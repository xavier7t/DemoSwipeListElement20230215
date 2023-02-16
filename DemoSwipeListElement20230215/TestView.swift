//
//  TestView.swift
//  DemoSwipeListElement20230215
//
//  Created by Xavier on 2/15/23.
//

import SwiftUI

struct TestView: View {
    @State var names = ["Jaydon", "Caleb", "Jed", "Flora", "Isha", "Ada", "Zayn"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(names, id: \.self) { name in
                    HStack {
                        Text(name)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            names.removeAll { $0 == name }
                            // or delete function for custom objects
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        Button(role: .cancel) {
                            // code to move goes here
                        } label: {
                            Label("Move", systemImage: "folder.fill")
                        }
                        .tint(.orange)

                    }
                    .swipeActions(edge: .leading) {
                        Button(role: .cancel) {
                            // code to like goes here
                        } label: {
                            Label("Favorite", systemImage: "flag")
                        }
                        .tint(.indigo)
                    }
                }
            }
            .navigationTitle("Swipe")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
