//
//  StateObservableObject.swift
//  Basics
//
//  Created by Дарья Литвинова on 01.12.2025.
//

import SwiftUI
internal import Combine

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    // property wrapper, создает Publisher для свойства и отправляет новое значение подписчикам каждый раз, когда свойство меняется
    /* что-то типа этого
     private var _name = "Dasha"

     var name: String {
         get { _name }
         set {
             objectWillChange.send()
             _name = newValue
         }
     }

     var $name: Published<String>.Publisher
     */
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        let fruit1 = FruitModel(name: "Banana", count: 10)
        let fruit2 = FruitModel(name: "Orange", count: 15)
        let fruit3 = FruitModel(name: "Mango", count: 8)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray = [fruit1, fruit2, fruit3]
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct StateObservableObject: View {
    // @StateObject - владелец объекта -> использовать при создании/инициализации; где View должна владеть его временем жизни
    // если вью пересоздается, то объект остается тем же
    
    // @ObservedObject - наблюдатель -> использовать для сабвью; используется там, где View не создаёт, а получает объект извне
    // если вью будет пересоздана, объект тоже будет загружен заново, даже если данные не менялись
    // если тут использовать state, то могут появиться проблемы, родитель владеет объектом, дочернее вью тоже пытается им владеть, может не обновится объект при смене в родителе
    // не получается пересоздать объект или наоборот сделать это неожиданно, например, если дочерний вью исчезнет/появится при навигации или анимации
    // сайд-эффекты (init, async) будут вызваны лишний раз
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            if fruitViewModel.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack(spacing: 10) {
                            Text("\(fruit.count)")
                                .foregroundStyle(.custom)
                            Text(fruit.name)
                                .font(.headline)
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit(index:))
                }
                .navigationTitle("Fruits")
                .toolbar {
                    ToolbarItem(
                        placement: .topBarTrailing,
                        content: {
                            NavigationLink(
                                destination: AnotherView(fruitViewModel: fruitViewModel),
                                label: {
                                    Image(systemName: "arrow.right")
                                })
                        })
                }
            }
        }
    }
}

struct AnotherView: View {
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ForEach(fruitViewModel.fruitArray) { fruit in
            Text("\(fruit.name)")
        }
    }
}

#Preview {
    StateObservableObject()
}
