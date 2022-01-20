//
//  ConstantsItems.swift
//  WeatherProjectTestOrion
//
//  Created by Tatyana Ilvutikova on 12.01.2022.
//

import Foundation
import SwiftUI

enum Constants {
  enum WidthGrid {
    public static let maxTemperature: CGFloat = 55
    public static let  minTemperature: CGFloat = 40
  }
  enum General {
    public static let roundRectCornerRadius: CGFloat = 4
  }
  enum Spacing {
    public static let dayOfTheWeek: CGFloat = 4
    public static let headerItems: CGFloat = 16
    public static let meteoAndHourlyDetails: CGFloat = 33
    public static let hourly: CGFloat = 15
  }
  enum Icon {
    public static let iconButtonListBullet = "list.bullet"
    public static let iconButtonBackToView = "chevron.left"
    public static let iconButtonActivEditList = "checkmark"
    public static let iconButtonNotActivEditList = "square.and.pencil"

    public static let iconButtonAddLocation = "plus.circle.fill"

    public static let iconButtonAdd = "plus"

    public static let iconButtonDelete = "xmark"
    public static let iconWind = "wind"
    public static let iconSafari = "safari"
    public static let iconDrop = "drop"
    public static let iconPlusCircle = "plus.circle.fill"
    public static let iconMinusCircle = "minus.circle.fill"
    public static let iconCurrentLocation = "paperplane.circle.fill"
    public static let iconButtonDeleteText = "xmark.circle.fill"
    public static let iconMagnifyingglass = "magnifyingglass"
  }
  enum Image {
    public static let backgroundHeaderWeatherView = "cloudyBackground"
    public static let imageMapPin = "mappin"
  }
}
