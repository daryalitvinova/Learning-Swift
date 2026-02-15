//
//  TypeAliass.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 05.02.2026.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

// просто знай что можно так, если когда-то вдруг случится такое, что надо будет модель точно такую но с другим именем
typealias TVModel = MovieModel

struct TypeAliass: View {
    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item1: TVModel = MovieModel(title: "Title", director: "Joe", count: 5)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypeAliass()
}
