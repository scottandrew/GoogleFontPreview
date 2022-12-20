//
//  FontDetails.swift
//  GoogleFontPreview
//
//  Created by Scott Andrew on 12/13/22.
//

import SwiftUI

struct DetailsView: View {
  var font: GoogleFont

  var body: some View {
    VStack {
      Text(font.family)
        .font(.system(size: 25, weight: .bold))
      Spacer()
      ScrollView {
        LazyVStack(alignment: .leading) {
          ForEach(font.files, id: \.id) { value in
            StyleCell(style: value)
          }
        }
      }
      .id(font.family)
    }
    .padding()
  }
}
