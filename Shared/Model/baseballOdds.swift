
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let baseballOdds = try? newJSONDecoder().decode(BaseballOdds.self, from: jsonData)

import Foundation

// MARK: - BaseballOdds
struct BaseballOdds: Codable {
    let baseballOddsGet: String
    let parameters: Parameters
    let errors: [JSONAny]
    let results: Int
    let response: [Response]

    enum CodingKeys: String, CodingKey {
        case baseballOddsGet = "get"
        case parameters, errors, results, response
    }
}

// MARK: - Parameters
struct Parameters: Codable {
    let league, season: String
}

// MARK: - Response
struct Response: Codable, Identifiable {
    let id = UUID()
    let league: League
    let country: Country
    let game: Game
    let bookmakers: [Bookmaker]
}

// MARK: - Bookmaker
struct Bookmaker: Codable {
    let id: Int
    let name: BookmakerName
    let bets: [Bet]
}

// MARK: - Bet
struct Bet: Codable {
    let id: Int
    let name: BetName
    let values: [Value]
}

enum BetName: String, Codable {
    case aRun1StInning = "A Run (1st Inning)"
    case asianHandicap = "Asian Handicap"
    case asianHandicap1St3Innings = "Asian Handicap (1st 3 Innings)"
    case asianHandicap1St5Innings = "Asian Handicap (1st 5 Innings)"
    case asianHandicap1St7Innings = "Asian Handicap (1st 7 Innings)"
    case asianHandicap1StInning = "Asian Handicap (1st Inning)"
    case awayTeamTotalGoalsIncludingOT = "Away Team Total Goals (Including OT)"
    case extraInnings = "Extra Innings"
    case firstTeamToScore = "First Team To Score"
    case homeAway = "Home/Away"
    case homeAway1StInning = "Home/Away (1st Inning)"
    case homeTeamTotalGoalsIncludingOT = "Home Team Total Goals (Including OT)"
    case htFTIncludingOT = "HT/FT (Including OT)"
    case lastTeamToScore = "Last Team To Score"
    case matchWinner = "Match Winner"
    case moneyLine1St3Innings = "Money Line (1st 3 Innings)"
    case moneyLine1St5Innings = "Money Line (1st 5 Innings)"
    case moneyLine1St7Innings = "Money Line (1st 7 Innings)"
    case oddEvenIncludingOT = "Odd/Even (Including OT)"
    case overUnder = "Over/Under"
    case overUnder1St3Innings = "Over/Under (1st 3 Innings)"
    case overUnder1St5Innings = "Over/Under (1st 5 Innings)"
    case overUnder1St7Innings = "Over/Under (1st 7 Innings)"
    case overUnder1StInning = "Over/Under (1st Inning)"
    case playerDoubles = "Player Doubles"
    case playerHomeRuns = "Player Home Runs"
    case playerRuns = "Player Runs"
    case playerSingles = "Player Singles"
    case playerStolenBases = "Player Stolen Bases"
    case playerTotalBases = "Player Total Bases"
    case playerTriples = "Player Triples"
    case the1X21St3Innings = "1x2 (1st 3 Innings)"
    case the1X21St5Innings = "1x2 (1st 5 Innings)"
    case the1X21St7Innings = "1x2 (1st 7 Innings)"
    case the1X21StInning = "1x2 (1st Inning)"
    case the1X22NdInning = "1x2 (2nd Inning)"
    case the1X23RDInning = "1x2 (3rd Inning)"
    case totalHits = "Total Hits"
}

// MARK: - Value
struct Value: Codable {
    let value, odd: String
}

enum BookmakerName: String, Codable {
    case bet365 = "Bet365"
    case betcris = "Betcris"
    case betsson = "Betsson"
    case betway = "Betway"
    case bovada = "Bovada"
    case bwin = "Bwin"
    case comeOn = "ComeOn"
    case dafabet = "Dafabet"
    case marathon = "Marathon"
    case nordicBet = "NordicBet"
    case pinnacle = "Pinnacle"
    case sbo = "SBO"
    case sportingbet = "Sportingbet"
    case the10Bet = "10Bet"
    case the1Xbet = "1xbet"
    case the888Sport = "888Sport"
    case tipico = "Tipico"
    case unibet = "Unibet"
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: CountryName
    let code: Code
    let flag: String
}

enum Code: String, Codable {
    case us = "US"
}

enum CountryName: String, Codable {
    case usa = "USA"
}

// MARK: - Game
struct Game: Codable {
    let id: Int
    let date: Date
    let time: String
    let timestamp: Int
    let timezone: Timezone
    let week: JSONNull?
    let status: Status
    let country: Country
    let league: League
    let teams: Teams
    let scores: Scores
}

// MARK: - League
struct League: Codable {
    let id: Int
    let name: LeagueName
    let type: TypeEnum
    let season: Int
    let logo: String
}

enum LeagueName: String, Codable {
    case mlb = "MLB"
}

enum TypeEnum: String, Codable {
    case league = "League"
}

// MARK: - Scores
struct Scores: Codable {
    let home, away: ScoresAway
}

// MARK: - ScoresAway
struct ScoresAway: Codable {
    let hits, errors: Int?
    let innings: Innings
    let total: Int?
}

// MARK: - Innings
struct Innings: Codable {
    let the1, the2, the3, the4: Int?
    let the5, the6, the7, the8: Int?
    let the9, extra: Int?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
        case the6 = "6"
        case the7 = "7"
        case the8 = "8"
        case the9 = "9"
        case extra
    }
}

// MARK: - Status
struct Status: Codable {
    let long: Long
    let short: Short
}

enum Long: String, Codable {
    case finished = "Finished"
    case notStarted = "Not Started"
}

enum Short: String, Codable {
    case ft = "FT"
    case ns = "NS"
}

// MARK: - Teams
struct Teams: Codable {
    let home, away: TeamsAway
}

// MARK: - TeamsAway
struct TeamsAway: Codable {
    let id: Int
    let name: String
    let logo: String
}

enum Timezone: String, Codable {
    case utc = "UTC"
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
