//
//  Models.swift
//  Basics
//
//  Created by Дарья Литвинова on 30.11.2025.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let folowersCount: Int
    let isVerified: Bool
    
    
}

struct Models: View {
    
    let users: [UserModel] = [
        UserModel(displayName: "Nick", userName: "nick123", folowersCount: 222, isVerified: true),
        UserModel(displayName: "Emily", userName: "itsemily1995", folowersCount: 55, isVerified: false),
        UserModel(displayName: "Samantha", userName: "ninja", folowersCount: 30, isVerified: false),
        UserModel(displayName: "Chris", userName: "chris2009", folowersCount: 438, isVerified: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack {
                        Circle()
                            .frame(width: 35, height: 35)
                        
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        
                        VStack {
                            Text("\(user.folowersCount)")
                                .font(.headline)
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

#Preview {
    Models()
}
