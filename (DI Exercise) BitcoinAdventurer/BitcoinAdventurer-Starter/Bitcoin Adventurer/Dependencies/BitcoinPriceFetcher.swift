import Foundation

protocol PriceFetcher {
  func fetch(response: @escaping (PriceResponse?) -> Void)
}

struct BitcoinPriceFetcher: PriceFetcher {
  let networking: Networking
  
  // Initialize the fetcher with a networking object
  init(networking: Networking) {
    self.networking = networking
  }
  
  // Fetch data, returning a PriceResponse object if successful
  func fetch(response: @escaping (PriceResponse?) -> Void) {
    networking.request(from: Coinbase.bitcoin) { data, error in
      // Log errors if we receive any, and abort
      if let error = error {
        print("Error recieved requesting Bitcoin price: \(error.localizedDescription)")
        response(nil)
      }
      
      // Parse data into a model object
      let decoded = self.decodeJSON(type: PriceResponse.self, from: data)
      if let decoded = decoded {
        print("Price returned: \(decoded.data.amount)")
      }
      response(decoded)
    }
  }
  
  // Decode JSON into an object of type 'T'
  private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
    let decoder = JSONDecoder()
    guard let data = from,
          let response = try? decoder.decode(type.self, from: data) else {
      return nil
    }
    
    return response
  }
}
