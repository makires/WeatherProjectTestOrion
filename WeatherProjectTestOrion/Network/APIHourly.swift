// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aPIHourly = try APIHourly(json)

import Foundation

// MARK: - APIHourly
struct APIHourly: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

// MARK: APIHourly convenience initializers and mutators

extension APIHourly {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(APIHourly.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        location: Location? = nil,
        current: Current? = nil,
        forecast: Forecast? = nil
    ) -> APIHourly {
        return APIHourly(
            location: location ?? self.location,
            current: current ?? self.current,
            forecast: forecast ?? self.forecast
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC, tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph, windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMB, pressureIn, precipMm, precipIn: Double
    let humidity, cloud: Int
    let feelslikeC, feelslikeF, visKM, visMiles: Double
    let uv, gustMph, gustKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: Current convenience initializers and mutators

extension Current {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Current.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lastUpdatedEpoch: Int? = nil,
        lastUpdated: String? = nil,
        tempC: Double? = nil,
        tempF: Double? = nil,
        isDay: Int? = nil,
        condition: Condition? = nil,
        windMph: Double? = nil,
        windKph: Double? = nil,
        windDegree: Int? = nil,
        windDir: String? = nil,
        pressureMB: Double? = nil,
        pressureIn: Double? = nil,
        precipMm: Double? = nil,
        precipIn: Double? = nil,
        humidity: Int? = nil,
        cloud: Int? = nil,
        feelslikeC: Double? = nil,
        feelslikeF: Double? = nil,
        visKM: Double? = nil,
        visMiles: Double? = nil,
        uv: Double? = nil,
        gustMph: Double? = nil,
        gustKph: Double? = nil
    ) -> Current {
        return Current(
            lastUpdatedEpoch: lastUpdatedEpoch ?? self.lastUpdatedEpoch,
            lastUpdated: lastUpdated ?? self.lastUpdated,
            tempC: tempC ?? self.tempC,
            tempF: tempF ?? self.tempF,
            isDay: isDay ?? self.isDay,
            condition: condition ?? self.condition,
            windMph: windMph ?? self.windMph,
            windKph: windKph ?? self.windKph,
            windDegree: windDegree ?? self.windDegree,
            windDir: windDir ?? self.windDir,
            pressureMB: pressureMB ?? self.pressureMB,
            pressureIn: pressureIn ?? self.pressureIn,
            precipMm: precipMm ?? self.precipMm,
            precipIn: precipIn ?? self.precipIn,
            humidity: humidity ?? self.humidity,
            cloud: cloud ?? self.cloud,
            feelslikeC: feelslikeC ?? self.feelslikeC,
            feelslikeF: feelslikeF ?? self.feelslikeF,
            visKM: visKM ?? self.visKM,
            visMiles: visMiles ?? self.visMiles,
            uv: uv ?? self.uv,
            gustMph: gustMph ?? self.gustMph,
            gustKph: gustKph ?? self.gustKph
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String
    let code: Int
}

// MARK: Condition convenience initializers and mutators

extension Condition {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Condition.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        text: String? = nil,
        icon: String? = nil,
        code: Int? = nil
    ) -> Condition {
        return Condition(
            text: text ?? self.text,
            icon: icon ?? self.icon,
            code: code ?? self.code
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: Forecast convenience initializers and mutators

extension Forecast {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Forecast.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        forecastday: [Forecastday]? = nil
    ) -> Forecast {
        return Forecast(
            forecastday: forecastday ?? self.forecastday
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

// MARK: Forecastday convenience initializers and mutators

extension Forecastday {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Forecastday.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        date: String? = nil,
        dateEpoch: Int? = nil,
        day: Day? = nil,
        astro: Astro? = nil,
        hour: [Hour]? = nil
    ) -> Forecastday {
        return Forecastday(
            date: date ?? self.date,
            dateEpoch: dateEpoch ?? self.dateEpoch,
            day: day ?? self.day,
            astro: astro ?? self.astro,
            hour: hour ?? self.hour
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase, moonIllumination: String

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

// MARK: Astro convenience initializers and mutators

extension Astro {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Astro.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        sunrise: String? = nil,
        sunset: String? = nil,
        moonrise: String? = nil,
        moonset: String? = nil,
        moonPhase: String? = nil,
        moonIllumination: String? = nil
    ) -> Astro {
        return Astro(
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset,
            moonrise: moonrise ?? self.moonrise,
            moonset: moonset ?? self.moonset,
            moonPhase: moonPhase ?? self.moonPhase,
            moonIllumination: moonIllumination ?? self.moonIllumination
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double
    let totalprecipMm, totalprecipIn, avgvisKM, avgvisMiles: Double
    let avghumidity: Double
    let dailyWillItRain, dailyChanceOfRain, dailyWillItSnow, dailyChanceOfSnow: Int
    let condition: Condition
    let uv: Double

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}

// MARK: Day convenience initializers and mutators

extension Day {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Day.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        maxtempC: Double? = nil,
        maxtempF: Double? = nil,
        mintempC: Double? = nil,
        mintempF: Double? = nil,
        avgtempC: Double? = nil,
        avgtempF: Double? = nil,
        maxwindMph: Double? = nil,
        maxwindKph: Double? = nil,
        totalprecipMm: Double? = nil,
        totalprecipIn: Double? = nil,
        avgvisKM: Double? = nil,
        avgvisMiles: Double? = nil,
        avghumidity: Double? = nil,
        dailyWillItRain: Int? = nil,
        dailyChanceOfRain: Int? = nil,
        dailyWillItSnow: Int? = nil,
        dailyChanceOfSnow: Int? = nil,
        condition: Condition? = nil,
        uv: Double? = nil
    ) -> Day {
        return Day(
            maxtempC: maxtempC ?? self.maxtempC,
            maxtempF: maxtempF ?? self.maxtempF,
            mintempC: mintempC ?? self.mintempC,
            mintempF: mintempF ?? self.mintempF,
            avgtempC: avgtempC ?? self.avgtempC,
            avgtempF: avgtempF ?? self.avgtempF,
            maxwindMph: maxwindMph ?? self.maxwindMph,
            maxwindKph: maxwindKph ?? self.maxwindKph,
            totalprecipMm: totalprecipMm ?? self.totalprecipMm,
            totalprecipIn: totalprecipIn ?? self.totalprecipIn,
            avgvisKM: avgvisKM ?? self.avgvisKM,
            avgvisMiles: avgvisMiles ?? self.avgvisMiles,
            avghumidity: avghumidity ?? self.avghumidity,
            dailyWillItRain: dailyWillItRain ?? self.dailyWillItRain,
            dailyChanceOfRain: dailyChanceOfRain ?? self.dailyChanceOfRain,
            dailyWillItSnow: dailyWillItSnow ?? self.dailyWillItSnow,
            dailyChanceOfSnow: dailyChanceOfSnow ?? self.dailyChanceOfSnow,
            condition: condition ?? self.condition,
            uv: uv ?? self.uv
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Hour
struct Hour: Codable {
    let timeEpoch: Int
    let time: String
    let tempC, tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph, windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMB, pressureIn, precipMm, precipIn: Double
    let humidity, cloud: Int
    let feelslikeC, feelslikeF, windchillC, windchillF: Double
    let heatindexC, heatindexF, dewpointC, dewpointF: Double
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int
    let visKM, visMiles, gustMph, gustKph: Double
    let uv: Double

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}

// MARK: Hour convenience initializers and mutators

extension Hour {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Hour.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        timeEpoch: Int? = nil,
        time: String? = nil,
        tempC: Double? = nil,
        tempF: Double? = nil,
        isDay: Int? = nil,
        condition: Condition? = nil,
        windMph: Double? = nil,
        windKph: Double? = nil,
        windDegree: Int? = nil,
        windDir: String? = nil,
        pressureMB: Double? = nil,
        pressureIn: Double? = nil,
        precipMm: Double? = nil,
        precipIn: Double? = nil,
        humidity: Int? = nil,
        cloud: Int? = nil,
        feelslikeC: Double? = nil,
        feelslikeF: Double? = nil,
        windchillC: Double? = nil,
        windchillF: Double? = nil,
        heatindexC: Double? = nil,
        heatindexF: Double? = nil,
        dewpointC: Double? = nil,
        dewpointF: Double? = nil,
        willItRain: Int? = nil,
        chanceOfRain: Int? = nil,
        willItSnow: Int? = nil,
        chanceOfSnow: Int? = nil,
        visKM: Double? = nil,
        visMiles: Double? = nil,
        gustMph: Double? = nil,
        gustKph: Double? = nil,
        uv: Double? = nil
    ) -> Hour {
        return Hour(
            timeEpoch: timeEpoch ?? self.timeEpoch,
            time: time ?? self.time,
            tempC: tempC ?? self.tempC,
            tempF: tempF ?? self.tempF,
            isDay: isDay ?? self.isDay,
            condition: condition ?? self.condition,
            windMph: windMph ?? self.windMph,
            windKph: windKph ?? self.windKph,
            windDegree: windDegree ?? self.windDegree,
            windDir: windDir ?? self.windDir,
            pressureMB: pressureMB ?? self.pressureMB,
            pressureIn: pressureIn ?? self.pressureIn,
            precipMm: precipMm ?? self.precipMm,
            precipIn: precipIn ?? self.precipIn,
            humidity: humidity ?? self.humidity,
            cloud: cloud ?? self.cloud,
            feelslikeC: feelslikeC ?? self.feelslikeC,
            feelslikeF: feelslikeF ?? self.feelslikeF,
            windchillC: windchillC ?? self.windchillC,
            windchillF: windchillF ?? self.windchillF,
            heatindexC: heatindexC ?? self.heatindexC,
            heatindexF: heatindexF ?? self.heatindexF,
            dewpointC: dewpointC ?? self.dewpointC,
            dewpointF: dewpointF ?? self.dewpointF,
            willItRain: willItRain ?? self.willItRain,
            chanceOfRain: chanceOfRain ?? self.chanceOfRain,
            willItSnow: willItSnow ?? self.willItSnow,
            chanceOfSnow: chanceOfSnow ?? self.chanceOfSnow,
            visKM: visKM ?? self.visKM,
            visMiles: visMiles ?? self.visMiles,
            gustMph: gustMph ?? self.gustMph,
            gustKph: gustKph ?? self.gustKph,
            uv: uv ?? self.uv
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

// MARK: Location convenience initializers and mutators

extension Location {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Location.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        region: String? = nil,
        country: String? = nil,
        lat: Double? = nil,
        lon: Double? = nil,
        tzID: String? = nil,
        localtimeEpoch: Int? = nil,
        localtime: String? = nil
    ) -> Location {
        return Location(
            name: name ?? self.name,
            region: region ?? self.region,
            country: country ?? self.country,
            lat: lat ?? self.lat,
            lon: lon ?? self.lon,
            tzID: tzID ?? self.tzID,
            localtimeEpoch: localtimeEpoch ?? self.localtimeEpoch,
            localtime: localtime ?? self.localtime
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
