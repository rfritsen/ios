//
//  ViewController.swift
//  api-practice
//
//  Created by Ryan on 7/24/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20) {
            Text("Title")
                .bold()
                .font(.title3)
            Text("This is where the JSON will go")
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct ContentVIew_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CurrentWeather: Codable {
    let winddir: Int
    let humidity: Int
}

func getUser() async throws -> GitHubUser {
    let endpoint = "https://api.weather.com/v2/pws/observations/current?stationId=KNJNEWJE43&format=json&units=e&apiKey=207102a190964a00b102a190961a0013"
    
    guard let url = URL(string: endpoint) else {
        throw GHError.InvalidURL
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw GHError.invalidResponse
    }
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(GitHubUser.self, from:data)
    } catch {
        throw GHError.statusInvalidData
    }
    }
}
