//
//  ContentView.swift
//  GoogleFontPreview
//
//  Created by Scott Andrew on 12/12/22.
//

import SwiftUI

struct ContentView: View {
  @State var fonts = [GoogleFont]()
  @State var font: GoogleFont?

  var body: some View {
    NavigationSplitView {
     FontList(selectedFont: $font, fonts: fonts)
    } detail: {
      if let font = font {
        DetailsView(font: font)
      } else {
        EmptyView()
      }
    }
    .task {
      do {
        fonts = try await GoogleFontService().syncFonts()
      
        await MainActor.run {
          font = fonts[0]
        }
      } catch {
        print (error)
      }
    }
  }
}

struct ContainerView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
