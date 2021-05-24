// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let espnnba = try? newJSONDecoder().decode(Espnnba.self, from: jsonData)

import Foundation

// MARK: - Espnnba
struct Espnnba: Codable {
    let leagues: [League]
    let season: ESPNNBASeason
    let day: Day
    let events: [Event]
}

// MARK: - Day
struct Day: Codable {
    let date: String
}

// MARK: - Event
struct Event: Codable, Identifiable {
    let id, uid, date, name: String
    let shortName: String
    let season: EventSeason
    let competitions: [Competition]
    let links: [EventLink]
    let status: Status
}

// MARK: - Competition
struct Competition: Codable {
    let id, uid, date: String
    let attendance: Int
    let type: CompetitionType
    let timeValid, neutralSite, conferenceCompetition, recent: Bool
    let venue: CompetitionVenue
    let competitors: [Competitor]
    let notes: [Note]
    let status: Status
    let broadcasts: [Broadcast]
    let startDate: String
    let geoBroadcasts: [GeoBroadcast]
    let headlines: [Headline]
}

// MARK: - Broadcast
struct Broadcast: Codable {
    let market: String
    let names: [String]
}

// MARK: - Competitor
struct Competitor: Codable {
    let id, uid, type: String
    let order: Int
    let homeAway: String
    let winner: Bool
    let team: Team
    let score: String
    let linescores: [Linescore]
    let statistics: [Statistic]
    let leaders: [CompetitorLeader]
    let records: [Record]
}

// MARK: - CompetitorLeader
struct CompetitorLeader: Codable {
    let name, displayName, shortDisplayName, abbreviation: String
    let leaders: [LeaderLeader]
}

// MARK: - LeaderLeader
struct LeaderLeader: Codable {
    let displayValue: String
    let value: Double
    let athlete: Athlete
    let team: TeamClass
}

// MARK: - Athlete
struct Athlete: Codable {
    let id, fullName, displayName, shortName: String
    let links: [AthleteLink]
    let headshot: String
    let jersey: String
    let position: Position
    let team: TeamClass
    let active: Bool
}

// MARK: - AthleteLink
struct AthleteLink: Codable {
    let rel: [Rel]
    let href: String
}

enum Rel: String, Codable {
    case advancedstats = "advancedstats"
    case athlete = "athlete"
    case bio = "bio"
    case desktop = "desktop"
    case gamelog = "gamelog"
    case news = "news"
    case overview = "overview"
    case playercard = "playercard"
    case splits = "splits"
    case stats = "stats"
}

// MARK: - Position
struct Position: Codable {
    let abbreviation: String
}

// MARK: - TeamClass
struct TeamClass: Codable {
    let id: String
}

// MARK: - Linescore
struct Linescore: Codable {
    let value: Int
}

// MARK: - Record
struct Record: Codable {
    let name: String
    let abbreviation: String?
    let type, summary: String
}

// MARK: - Statistic
struct Statistic: Codable {
    let name, abbreviation, displayValue: String
}

// MARK: - Team
struct Team: Codable {
    let id, uid, location, name: String
    let abbreviation, displayName, shortDisplayName, color: String
    let alternateColor: String
    let isActive: Bool
    let venue: TeamClass
    let links: [TeamLink]
    let logo: String
}

// MARK: - TeamLink
struct TeamLink: Codable {
    let rel: [String]
    let href: String
    let text: String
    let isExternal, isPremium: Bool
}

// MARK: - GeoBroadcast
struct GeoBroadcast: Codable {
    let type: GeoBroadcastType
    let market: Market
    let media: Media
    let lang, region: String
}

// MARK: - Market
struct Market: Codable {
    let id, type: String
}

// MARK: - Media
struct Media: Codable {
    let shortName: String
}

// MARK: - GeoBroadcastType
struct GeoBroadcastType: Codable {
    let id, shortName: String
}

// MARK: - Headline
struct Headline: Codable {
    let headlineDescription, type, shortLinkText: String
    let video: [Video]

    enum CodingKeys: String, CodingKey {
        case headlineDescription = "description"
        case type, shortLinkText, video
    }
}

// MARK: - Video
struct Video: Codable {
    let id: Int
    let source, headline: String
    let thumbnail: String
    let duration: Int
    let tracking: Tracking
    let deviceRestrictions: DeviceRestrictions
    let geoRestrictions: GeoRestrictions
    let links: Links
}

// MARK: - DeviceRestrictions
struct DeviceRestrictions: Codable {
    let type: String
    let devices: [String]
}

// MARK: - GeoRestrictions
struct GeoRestrictions: Codable {
    let type: String
    let countries: [String]
}

// MARK: - Links
struct Links: Codable {
    let api: API
    let web: Web
    let source: Source
    let mobile: Mobile
}

// MARK: - API
struct API: Codable {
    let apiSelf, artwork: Artwork

    enum CodingKeys: String, CodingKey {
        case apiSelf = "self"
        case artwork
    }
}

// MARK: - Artwork
struct Artwork: Codable {
    let href: String
}

// MARK: - Mobile
struct Mobile: Codable {
    let alert, source: Artwork
    let href: String
    let streaming, progressiveDownload: Artwork
}

// MARK: - Source
struct Source: Codable {
    let mezzanine, flash, hds: Artwork
    let hls: HLS
    let hd, full: Artwork
    let href: String

    enum CodingKeys: String, CodingKey {
        case mezzanine, flash, hds
        case hls = "HLS"
        case hd = "HD"
        case full, href
    }
}

// MARK: - HLS
struct HLS: Codable {
    let href: String
    let hd: Artwork

    enum CodingKeys: String, CodingKey {
        case href
        case hd = "HD"
    }
}

// MARK: - Web
struct Web: Codable {
    let href: String
    let short, webSelf: Artwork

    enum CodingKeys: String, CodingKey {
        case href, short
        case webSelf = "self"
    }
}

// MARK: - Tracking
struct Tracking: Codable {
    let sportName, leagueName, coverageType, trackingName: String
    let trackingID: String

    enum CodingKeys: String, CodingKey {
        case sportName, leagueName, coverageType, trackingName
        case trackingID = "trackingId"
    }
}

// MARK: - Note
struct Note: Codable {
    let type, headline: String
}

// MARK: - Status
struct Status: Codable {
    let clock: Int
    let displayClock: String
    let period: Int
    let type: StatusType
}

// MARK: - StatusType
struct StatusType: Codable {
    let id, name, state: String
    let completed: Bool
    let typeDescription, detail, shortDetail, altDetail: String

    enum CodingKeys: String, CodingKey {
        case id, name, state, completed
        case typeDescription = "description"
        case detail, shortDetail, altDetail
    }
}

// MARK: - CompetitionType
struct CompetitionType: Codable {
    let id, abbreviation: String
}

// MARK: - CompetitionVenue
struct CompetitionVenue: Codable {
}

// MARK: - EventLink
struct EventLink: Codable {
    let language: String
    let rel: [String]
    let href: String
    let text, shortText: String
    let isExternal, isPremium: Bool
}

// MARK: - EventSeason
struct EventSeason: Codable {
    let year, type: Int
    let slug: String
}

// MARK: - League
struct League: Codable {
    let id, uid, name, abbreviation: String
    let slug: String
    let season: LeagueSeason
    let calendarType: String
    let calendarIsWhitelist: Bool
    let calendarStartDate, calendarEndDate: String
    let calendar: [JSONAny]
}

// MARK: - LeagueSeason
struct LeagueSeason: Codable {
    let year: Int
    let startDate, endDate: String
    let type: SeasonType
}

// MARK: - SeasonType
struct SeasonType: Codable {
    let id: String
    let type: Int
    let name, abbreviation: String
}

// MARK: - ESPNNBASeason
struct ESPNNBASeason: Codable {
    let type, year: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
