//
//  FontWeight.swift
//  DuffleBag
//
//  Created by Scott Andrew on 11/1/22.
//

import Foundation

enum Style: String, Hashable {
  case thin = "100"
  case thinItalic = "100italic"
  case extraLight = "200"
  case extraLightItalic = "200italic"
  case light = "300"
  case lightItalic = "300italic"
  case normal = "regular"
  case normalItalic = "italic"
  case medium = "500"
  case mediumItalic = "500italic"
  case semiBold = "600"
  case semiBoldItalic = "600italic"
  case bold = "700"
  case boldItalic = "700italic"
  case extraBold = "800"
  case extraBoldItalic = "800italic"
  case black = "900"
  case blackItalic = "900italic"

  var friendlyName: String {
    switch self {
    case .thin: return "Thin"
    case .thinItalic: return "Thin Italic"
    case .extraLight: return "Extra Light"
    case .extraLightItalic: return "Extra Light Italic"
    case .light: return "Light"
    case .lightItalic: return "Light Italic"
    case .normal: return "Normal"
    case .normalItalic: return "Italic"
    case .medium: return "Medium"
    case .mediumItalic: return "Medium Italic"
    case .semiBold: return "Semi Bold"
    case .semiBoldItalic: return "Semi Bold Italic"
    case .bold: return "Bold"
    case .boldItalic: return "Bold Italic"
    case .extraBold: return "Extra Bold"
    case .extraBoldItalic: return "Extra Bold Italic"
    case .black: return "Black"
    case .blackItalic: return "Black Italic"
    }
  }
}
