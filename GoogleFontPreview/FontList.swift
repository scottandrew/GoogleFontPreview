//
//  FontList.swift
//  GoogleFontPreview
//
//  Created by Scott Andrew on 12/17/22.
//

import SwiftUI

struct FontList: View {
  @Binding var selectedFont: GoogleFont?
  var fonts: [GoogleFont]
  
  var body: some View {
    List(fonts, selection: $selectedFont) { font in
      NavigationLink(value: font) {
        VStack(alignment: .leading) {
          Text(font.family)
            .font(.system(size: 14, weight: .bold))
          Text("\(font.files.count) styles")
            .font(.system(size: 14))
        }
        .padding(8)
      }
    }
  }
}
