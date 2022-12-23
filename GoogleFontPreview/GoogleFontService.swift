//
//  GoogleFontServic.swift
//  DuffleBag
//
//  Created by Scott Andrew on 10/25/22.
//

import Foundation

class GoogleFontService {
  let apiKey = "** Put your key here **"

  func syncFonts() async throws -> [GoogleFont] {
    var components = URLComponents()

    components.scheme = "https"
    components.host = "www.googleapis.com"
    components.path = "/webfonts/v1/webfonts"
    components.queryItems = [
      URLQueryItem(name: "key", value: apiKey),
      URLQueryItem(name: "sort", value: "alpha")
    ]

    let url = components.url!
    let request = URLRequest(url: url)

    let (data, _) = try await URLSession.shared.data(for: request)
    let googleResponse = try JSONDecoder()
      .decode(GoogleResponse.self, from: data)

    return googleResponse.items
  }
}
