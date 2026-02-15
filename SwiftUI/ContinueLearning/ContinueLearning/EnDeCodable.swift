//
//  EnDeCodable.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 05.02.2026.
//

import SwiftUI
import Combine

struct CustomerModel: Identifiable, /*Decodable, Encodable*/ Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    /* Все это по сути можно опускать
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case points
        // если получается так, что в модели и в json отличаются в именах, можно это тут задать через = "что там в json"
        case isPremium
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(points, forKey: .points)
        try container.encode(name, forKey: .name)
        try container.encode(isPremium, forKey: .isPremium)
    }*/
}

class EnDeCodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = CustomerModel(id: "1", name: "Nick", points: 5, isPremium: true)
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        //print("JSON data:")
        //print(data)
        
        //let jsonString = String(bytes: data, encoding: .utf8)
        //print(jsonString)
        
        // это все описывать не очень, поэтому на помощь Decodable
//        if let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//           let dictionary = localData as? [String:Any],
//           let id = dictionary["id"] as? String,
//           let name = dictionary["name"] as? String,
//           let points = dictionary["points"] as? Int,
//           let isPremium = dictionary["isPremium"] as? Bool {
//            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//        }
        // c Decodable так получается
//        do {
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error decoding. \(error)")
//        }
        // достаточно даже этого, все будет работать корректно
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
    }
    
    private func getJSONData() -> Data? {
//        let dictionary: [String:Any] = [
//            "id": "12345",
//            "name": "Joe",
//            "points": 5,
//            "isPremium": true
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let customer = CustomerModel(id: "1111", name: "John", points: 8, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        
        return jsonData
    }
}

struct EnDeCodable: View {
    @StateObject private var viewModel = EnDeCodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = viewModel.customer {
                Text(customer.id)
                Text(customer.name)
                Text(customer.isPremium.description)
                Text("\(customer.points)")
            }
        }
    }
}

#Preview {
    EnDeCodable()
}
