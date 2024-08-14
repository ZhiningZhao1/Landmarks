//
//  ContentView.swift
//  Landmarks
//
//  Created by Zhining Zhao on 8/13/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack
        {
            MapView()
                .frame(height:300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading)
            {
                Text("Turtle Rock")
                    .font(.title)
                HStack
                {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Turtle Rock in Wyoming is a fascinating natural landmark located within the Vedauwoo Recreation Area, which is situated in the Medicine Bow-Routt National Forest in southeastern Wyoming. Vedauwoo, derived from an Arapaho word meaning 'earth-born,' is renowned for its dramatic and rugged granite formations that have been shaped by millions of years of geological activity.")
            }
            .padding()
            
            Spacer()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
