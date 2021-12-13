//
//  DetailsForCurrentWeatherViewTP.swift
//  WeatherProjectTestOrion
//
//  Created by Tatiana Ilvutikova on 12.12.2021.
//

import SwiftUI

struct DetailsForCurrentWeatherViewTP: View {
    var body: some View {
        ZStack {
        Group {
            Text("983 hPa")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -183, y: 0)

            Text("83%")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -194, y: 28)

            Text("10 km/h, SE")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -173.50, y: -28)

            Text("Now")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -94, y: -28)

            Text("18:00")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -47, y: -28)

            Text("19:00")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -3, y: -28)

            Text("20:00")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 42, y: -28)

            Text("21:00")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 85, y: -28)

            Text("22:00")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 130, y: -28)

            Text("23:00")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 174, y: -28)
        }
        Group {
            Text("00:00")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 218, y: -28)

            Text("+16°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -93.50, y: 28)

            Text("+17°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -50, y: 28)

            Text("+16°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: -5.50, y: 28)

            Text("+16°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 38.50, y: 28)

            Text("+15°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 82.50, y: 28)

            Text("+13°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 126.50, y: 28)

            Text("+12°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 170.50, y: 28)

            Text("+12°")
            .font(.caption)
            .lineSpacing(16)
            .offset(x: 214.50, y: 28)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: -95, y: 0)
            .frame(width: 24, height: 24)
        }
        Group {
            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: -51, y: 0)
            .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: -7, y: 0)
            .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: 37, y: 0)
            .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: 81, y: 0)
            .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: 125, y: 0)
            .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: 169, y: 0)
            .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: 213, y: 0)
            .frame(width: 24, height: 24)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: -224, y: 0)
            .frame(width: 18, height: 18)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: -224, y: -28)
            .frame(width: 18, height: 18)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            .offset(x: -224, y: 28)
            .frame(width: 18, height: 18)
        }
        }
        .frame(width: 498, height: 88)
    }
}

struct DetailsForCurrentWeatherViewTP_Previews: PreviewProvider {
    static var previews: some View {
        DetailsForCurrentWeatherViewTP()
    }
}
