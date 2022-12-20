//
//  GoogleFont.swift
//  DuffleBag
//
//  Created by Scott Andrew on 10/26/22.
//

import Foundation

struct GoogleResponse: Decodable {
  let kind: String
  let items: [GoogleFont]
}

struct FontFile: Hashable, Identifiable {
  let style: Style
  let id = UUID()
  let url: URL
}

struct GoogleFont: Hashable, Decodable, Identifiable {
  var id: String { family }
    
  let family: String
  let files: [FontFile]
  let version: String
  let category: String
    
  enum CodingKeys: CodingKey {
    case family
    case files
    case version
    case category
  }
    
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.family = try container.decode(String.self, forKey: .family)
    let files = try container.decode([String: String].self, forKey: .files)
    self.version = try container.decode(String.self, forKey: .version)
    self.category = try container.decode(String.self, forKey: .category)
        
    var keys = Array(files.keys)
        
    // lets do a bit of work to get our files that we want.
    keys.sort { item1, item2 in
      func itemFixer(_ value: String) -> String {
        if value == "regular" {
          return "400"
        } else if value == "italic" {
          return "400Italic"
        }
                
        return value
      }
            
      let fixedItem1 = itemFixer(item1)
      let fixedItem2 = itemFixer(item2)
                
      return fixedItem1 < fixedItem2
    }
        
    self.files = keys.compactMap { key in
      guard let style = Style(rawValue: key),
            let location = files[key]?.replacingOccurrences(of: "http", with: "https")
      else {
        return nil
      }
            
      return FontFile(style: style, url: URL(string: location)!)
    }
  }
}
