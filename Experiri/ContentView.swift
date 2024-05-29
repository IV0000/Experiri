//
//  ContentView.swift
//  Experiri
//
//  Created by Ivan Voloshchuk on 29/05/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var experiences: [Experience]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(experiences) { experience in
                    NavigationLink {
                        Text(experience.title)
                    } label: {
                        Text("Experience at \(experience.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an experience")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Experience(title: "1", detail: "a b c", rating: 2, timestamp: Date(), category: .init(name: "123", hexColor: 01))
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(experiences[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Experience.self, inMemory: true)
}
