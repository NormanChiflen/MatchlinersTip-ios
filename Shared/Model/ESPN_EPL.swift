////
////  ESPN_EPL.swift
////  UnderDog Prototype
////
////  Created by John Lee on 5/21/21.
////
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let espnEpl = try? newJSONDecoder().decode(EspnEpl.self, from: jsonData)
//
//import Foundation
//
//// MARK: - EspnEpl
//struct EspnEpl: Codable {
//    let leagues: [League]
//    let season: ESPNEPLSeason
//    let day: Day
//    let events: [Event]
//}
//
//// MARK: - Day
//struct Day: Codable {
//    let date: String
//}
//
//// MARK: - Event
//struct Event: Codable {
//    let id, uid: String
//    let date: DateEnum
//    let name, shortName: String
//    let season: EventSeason
//    let competitions: [Competition]
//    let links: [AwayTeamOddsLink]
//    let status: Status
//}
//
//// MARK: - Competition
//struct Competition: Codable {
//    let id, uid: String
//    let date: DateEnum
//    let attendance: Int
//    let timeValid, neutralSite, conferenceCompetition, gamecastAvailable: Bool
//    let recent: Bool
//    let venue: CompetitionVenue
//    let competitors: [Competitor]
//    let notes: [JSONAny]
//    let situation: Situation
//    let status: Status
//    let broadcasts, details: [JSONAny]
//    let startDate: DateEnum
//    let geoBroadcasts: [JSONAny]
//    let odds: [Odd]
//}
//
//// MARK: - Competitor
//struct Competitor: Codable {
//    let id, uid: String
//    let type: TypeElement
//    let order: Int
//    let homeAway: HomeAwayElement
//    let winner: Bool
//    let team: CompetitorTeam
//    let score, form: String
//    let records: [Record]
//    let leaders: [CompetitorLeader]
//}
//
//enum HomeAwayElement: String, Codable {
//    case away = "away"
//    case bet365 = "bet-365"
//    case bets = "bets"
//    case desktop = "desktop"
//    case draw = "draw"
//    case event = "event"
//    case home = "home"
//    case stats = "stats"
//    case summary = "summary"
//}
//
//// MARK: - CompetitorLeader
//struct CompetitorLeader: Codable {
//    let name: LeaderName
//    let displayName, shortDisplayName: DisplayName
//    let abbreviation: LeaderAbbreviation
//    let leaders: [LeaderLeader]
//}
//
//enum LeaderAbbreviation: String, Codable {
//    case g = "G"
//}
//
//enum DisplayName: String, Codable {
//    case goals = "Goals"
//}
//
//// MARK: - LeaderLeader
//struct LeaderLeader: Codable {
//    let displayValue, shortDisplayValue: String
//    let value: Int
//    let athlete: Athlete
//    let team: TeamClass
//}
//
//// MARK: - Athlete
//struct Athlete: Codable {
//    let id, fullName, displayName, shortName: String
//    let links: [AthleteLink]
//    let jersey: String
//    let position: Position
//    let team: TeamClass
//    let active: Bool
//}
//
//// MARK: - AthleteLink
//struct AthleteLink: Codable {
//    let rel: [PurpleRel]
//    let href: String
//}
//
//enum PurpleRel: String, Codable {
//    case athlete = "athlete"
//    case bio = "bio"
//    case desktop = "desktop"
//    case gamelog = "gamelog"
//    case mobile = "mobile"
//    case news = "news"
//    case overview = "overview"
//    case playercard = "playercard"
//    case splits = "splits"
//    case stats = "stats"
//    case transfers = "transfers"
//}
//
//// MARK: - Position
//struct Position: Codable {
//    let abbreviation: PositionAbbreviation
//}
//
//enum PositionAbbreviation: String, Codable {
//    case f = "F"
//    case m = "M"
//}
//
//// MARK: - TeamClass
//struct TeamClass: Codable {
//    let id: String
//}
//
//enum LeaderName: String, Codable {
//    case goals = "goals"
//    case goalsLeaders = "goalsLeaders"
//}
//
//// MARK: - Record
//struct Record: Codable {
//    let name: RecordName
//    let abbreviation: RecordAbbreviation
//    let type: RecordType
//    let summary: String
//}
//
//enum RecordAbbreviation: String, Codable {
//    case total = "Total"
//}
//
//enum RecordName: String, Codable {
//    case allSplits = "All Splits"
//}
//
//enum RecordType: String, Codable {
//    case total = "total"
//}
//
//// MARK: - CompetitorTeam
//struct CompetitorTeam: Codable {
//    let id, uid, location, name: String
//    let abbreviation, displayName, shortDisplayName, color: String
//    let alternateColor: String
//    let isActive: Bool
//    let venue: TeamClass
//    let links: [TeamLink]
//    let logo: String
//}
//
//// MARK: - TeamLink
//struct TeamLink: Codable {
//    let rel: [TypeElement]
//    let href: String
//    let text: PurpleText
//    let isExternal, isPremium: Bool
//}
//
//enum TypeElement: String, Codable {
//    case app = "app"
//    case clubhouse = "clubhouse"
//    case desktop = "desktop"
//    case results = "results"
//    case schedule = "schedule"
//    case scores = "scores"
//    case sportscenter = "sportscenter"
//    case squad = "squad"
//    case standings = "standings"
//    case stats = "stats"
//    case team = "team"
//}
//
//enum PurpleText: String, Codable {
//    case clubhouse = "Clubhouse"
//    case fixtures = "Fixtures"
//    case results = "Results"
//    case scores = "Scores"
//    case squad = "Squad"
//    case standings = "Standings"
//    case stats = "Stats"
//}
//
//enum DateEnum: String, Codable {
//    case the20210523T1500Z = "2021-05-23T15:00Z"
//}
//
//// MARK: - Odd
//struct Odd: Codable {
//    let provider: Provider
//    let details: String?
//    let overUnder: Double?
//    let drawOdds: DrawOdds
//    let awayTeamOdds, homeTeamOdds: TeamOdds?
//}
//
//// MARK: - TeamOdds
//struct TeamOdds: Codable {
//    let team: AwayTeamOddsTeam
//    let summary: String?
//    let value: Double?
//    let handicap: Int?
//    let link: AwayTeamOddsLink?
//    let favorite, underdog: Bool?
//    let moneyLine, spreadOdds: Int?
//}
//
//// MARK: - AwayTeamOddsLink
//struct AwayTeamOddsLink: Codable {
//    let language: Language
//    let rel: [HomeAwayElement]
//    let href: String
//    let text, shortText: ShortTextEnum
//    let isExternal, isPremium: Bool
//}
//
//enum Language: String, Codable {
//    case enUS = "en-US"
//}
//
//enum ShortTextEnum: String, Codable {
//    case awayBet = "Away Bet"
//    case drawBet = "Draw Bet"
//    case homeBet = "Home Bet"
//    case statistics = "Statistics"
//    case summary = "Summary"
//}
//
//// MARK: - AwayTeamOddsTeam
//struct AwayTeamOddsTeam: Codable {
//    let id, uid, abbreviation, displayName: String
//    let logo: String
//}
//
//// MARK: - DrawOdds
//struct DrawOdds: Codable {
//    let moneyLine: Int?
//    let summary: String?
//    let value: Double?
//    let handicap: Int?
//    let link: AwayTeamOddsLink?
//}
//
//// MARK: - Provider
//struct Provider: Codable {
//    let id: String
//    let name: ProviderName
//    let priority: Int
//}
//
//enum ProviderName: String, Codable {
//    case accuscore = "accuscore"
//    case bet365 = "Bet 365"
//    case williamHillNewJersey = "William Hill (New Jersey)"
//}
//
//// MARK: - Situation
//struct Situation: Codable {
//    let ref: String
//
//    enum CodingKeys: String, CodingKey {
//        case ref = "$ref"
//    }
//}
//
//// MARK: - Status
//struct Status: Codable {
//    let clock: Int
//    let displayClock: DisplayClock
//    let period: Int
//    let type: StatusType
//}
//
//enum DisplayClock: String, Codable {
//    case the0 = "0'"
//}
//
//// MARK: - StatusType
//struct StatusType: Codable {
//    let id: String
//    let name: TypeName
//    let state: State
//    let completed: Bool
//    let typeDescription: Description
//    let detail: Detail
//    let shortDetail: ShortDetail
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, state, completed
//        case typeDescription = "description"
//        case detail, shortDetail
//    }
//}
//
//enum Detail: String, Codable {
//    case sunMay23RDAt1100AMEDT = "Sun, May 23rd at 11:00 AM EDT"
//}
//
//enum TypeName: String, Codable {
//    case statusScheduled = "STATUS_SCHEDULED"
//}
//
//enum ShortDetail: String, Codable {
//    case the5231100AmEdt = "5/23 - 11:00 AM EDT"
//}
//
//enum State: String, Codable {
//    case pre = "pre"
//}
//
//enum Description: String, Codable {
//    case scheduled = "Scheduled"
//}
//
//// MARK: - CompetitionVenue
//struct CompetitionVenue: Codable {
//    let id, fullName: String
//    let address: Address
//    let capacity: Int
//}
//
//// MARK: - Address
//struct Address: Codable {
//    let city: String
//    let country: Country
//}
//
//enum Country: String, Codable {
//    case england = "England"
//}
//
//// MARK: - EventSeason
//struct EventSeason: Codable {
//    let year, type: Int
//    let slug: Slug
//}
//
//enum Slug: String, Codable {
//    case the202021EnglishPremierLeague = "2020-21-english-premier-league"
//}
//
//// MARK: - League
//struct League: Codable {
//    let id, uid, name, abbreviation: String
//    let midsizeName, slug: String
//    let season: LeagueSeason
//    let calendarType: String
//    let calendarIsWhitelist: Bool
//    let calendarStartDate, calendarEndDate: String
//    let calendar: [String]
//}
//
//// MARK: - LeagueSeason
//struct LeagueSeason: Codable {
//    let year: Int
//    let startDate, endDate: String
//    let type: SeasonType
//}
//
//// MARK: - SeasonType
//struct SeasonType: Codable {
//    let id: String
//    let type: Int
//    let name, abbreviation: String
//}
//
//// MARK: - ESPNEPLSeason
//struct ESPNEPLSeason: Codable {
//    let type, year: Int
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
