//
//  FetchRequestCoreData.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 01.02.2026.
//

import SwiftUI
import CoreData
import Combine

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var fruits: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Ошибка загрузки Core Data. \(error.localizedDescription)")
            } else {
                print("Core Data загружена!")
            }
        }
        
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            fruits = try container.viewContext.fetch(request)
        } catch let error {
            print("Ошибка получения данных. \(error.localizedDescription)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        
        saveData()
        
    }
    
    func deleteFruit(indexSet: IndexSet) {
        indexSet.map({ fruits[$0] }).forEach(container.viewContext.delete)
        
        saveData()
    }
    
    func updateFruit(fruit: FruitEntity) {
        let currentName = fruit.name ?? ""
        let newName = currentName + "!"
        
        fruit.name = newName
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits() // чтобы обновилось в ui
        } catch let error {
            print("Ошибка сохранения. \(error.localizedDescription)")
        }
    }
}

struct FetchRequestCoreData: View {
    @StateObject private var viewModel = CoreDataViewModel()
    @State private var fruitName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add fruit here...", text: $fruitName)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .clipShape(Capsule())
                
                Button(action: {
                    guard !fruitName.isEmpty else { return }
                    
                    viewModel.addFruit(text: fruitName)
                    fruitName = ""
                }, label: {
                    Text("Submit")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(#colorLiteral(red: 1, green: 0.2923557162, blue: 0.5565357208, alpha: 1)))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        .padding(.vertical)
                })
                
                List {
                    ForEach(viewModel.fruits) { fruit in
                        Text(fruit.name ?? "No Name")
                            .onTapGesture {
                                viewModel.updateFruit(fruit: fruit)
                            }
                    }
                    .onDelete(perform: viewModel.deleteFruit)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Fruits")
            .padding(.horizontal)
        }
    }
}

#Preview {
    FetchRequestCoreData()
}
