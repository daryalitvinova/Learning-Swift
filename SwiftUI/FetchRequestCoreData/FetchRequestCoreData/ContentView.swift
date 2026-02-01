//
//  ContentView.swift
//  FetchRequestCoreData
//
//  Created by Дарья Литвинова on 31.01.2026.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    // получаем все в порядке возрастания
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    @FetchRequest(
        entity: FruitEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)]) private var fruits: FetchedResults<FruitEntity>
    
    @State private var textFieldText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                TextField("Enter name here...", text: $textFieldText)
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .font(.headline)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
                
                Button(action: {
                    addItem()
                }, label : {
                    Text("Submit")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal)
                })
                List {
                    ForEach(fruits) { fruit in
                        Text(fruit.name ?? "")
                            .onTapGesture {
                                updateItem(fruit: fruit)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Fruits")
        }
    }

    private func addItem() {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = textFieldText

            saveFruits()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map({ fruits[$0] }).forEach(viewContext.delete)

            saveFruits()
        }
    }
    
    private func updateItem(fruit: FruitEntity) {
        let currentName = fruit.name ?? ""
        let newName = currentName + "!"

        fruit.name = newName
        saveFruits()
    }
    
    private func saveFruits() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
