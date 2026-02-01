//
//  MapFilterSort.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 31.01.2026.
//

import SwiftUI
import Combine

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Alice", points: 55, isVerified: true)
        let user2 = UserModel(name: "Bob", points: 2, isVerified: false)
        let user3 = UserModel(name: nil, points: 88, isVerified: true)
        let user4 = UserModel(name: "Sabrina", points: 4, isVerified: false)
        let user5 = UserModel(name: "Katrine", points: 29, isVerified: false)
        let user6 = UserModel(name: nil, points: 53, isVerified: true)
        let user7 = UserModel(name: "John", points: 92, isVerified: true)
        let user8 = UserModel(name: "Nick", points: 8, isVerified: true)
        let user9 = UserModel(name: "Hailey", points: 16, isVerified: false)
        let user10 = UserModel(name: "Luck", points: 38, isVerified: false)
        
        self.users.append( contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
            ]
        )
    }
    
    func updateFilteredArray() {
        // sort
        //        filteredArray = users.sorted(by: { user1, user2 in
        //            return user1.points > user2.points
        //        })
        //filteredArray = users.sorted(by: { $0.points > $1.points })
        
        // filter
        //filteredArray = users.filter( { $0.isVerified })
        
        // map
//        mappedArray = users.map({ (user) -> String in
//            return user.name ?? "ERROR"
//        })
        //mappedArray = users.map(\.name)
        //mappedArray = users.map( { $0.name } )
        //mappedArray = users.compactMap(\.name)
        
        mappedArray = users
            .filter({ $0.isVerified })
            .sorted(by: { $0.points > $1.points })
            .compactMap({ $0.name })
    }
}

struct MapFilterSort: View {
    @StateObject var viewModel = UserViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                //                ForEach(viewModel.filteredArray) { user in
                //                    VStack(alignment: .leading) {
                //                        Text(user.name)
                //                            .font(.headline)
                //                        HStack {
                //                            Text("Points: \(user.points)")
                //                            Spacer()
                //                            if user.isVerified {
                //                                Image(systemName: "flame.fill")
                //                            }
                //                        }
                //                    }
                //                    .padding()
                //                    .foregroundStyle(.white)
                //                    .background(.blue)
                //                    .clipShape(RoundedRectangle(cornerRadius: 15))
                //                }
                ForEach(viewModel.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.headline)
                }
                }
            .padding(.horizontal)
        }
    }
}

#Preview {
    MapFilterSort()
}
