//
//  Font+Utils.swift
//  GoogleFontPreview
//
//  Created by Scott Andrew on 12/13/22.
//

import SwiftUI

extension Font {
  static func register(url: URL, size: CGFloat = 18) async throws -> Font? {
    do {
      let request = URLRequest(url: url)
      let (data, _) = try await URLSession.shared.data(for: request)
            
      guard let provider = CGDataProvider(data: data as CFData),
            let cgFont = CGFont(provider)
      else {
        print("Unsucessfully registered font")
        return nil
      }
            
      let ctFont = CTFontCreateWithGraphicsFont(cgFont, size, nil, nil)
            
      return Font(ctFont)
    } catch {
      print(error)
    }
        
    return nil
  }
}
