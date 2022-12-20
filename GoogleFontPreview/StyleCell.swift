//
//  StyleCell.swift
//  GoogleFontPreview
//
//  Created by Scott Andrew on 12/13/22.
//

import SwiftUI

struct StyleCell: View {
  let style: FontFile
  @State var font: Font?

  var body: some View {
    GroupBox(label: Text(style.style.friendlyName)) {
      if let font = font {
        Text("ABCDEFGHJKLMNOPQRSTUVWXYZ\nabcdefghijklmnopqrstuvwxyz\n1234567890")
          .font(font)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      else {
        Text("trying to load")
          .font(.system(size: 20))
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
    .task {
      font = try? await Font.register(url: style.url, size: 32)
    }
    .padding()
  }
}
