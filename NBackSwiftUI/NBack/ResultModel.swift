//
//  SessionModel.swift
//  NBack
//
//  Created by Leo Zaki on 2021-12-01.
//

import Foundation

class ResultModel : Codable, Identifiable, Equatable, Hashable {
    
    static func == (lhs: ResultModel, rhs: ResultModel) -> Bool {
        lhs.time == rhs.time
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(time)
    }
    
    let preferences: PreferencesModel
    let visualIncorrect: Int
    let visualCorrect: Int
    let audioIncorrect: Int
    let audioCorrect: Int
    let time: Date
    
    init(_ preferences: PreferencesModel, _ visualIncorrect: Int, _ visualCorrect: Int, _ audioIncorrect: Int, _ audioCorrect: Int)
    {
        self.preferences = preferences
        self.visualIncorrect = visualIncorrect
        self.visualCorrect = visualCorrect
        self.audioIncorrect = audioIncorrect
        self.audioCorrect = audioCorrect
        self.time = Date.now
    }
    
    private static let key = "LastResults"
    
    static func load() -> [ResultModel] {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                return try JSONDecoder().decode([ResultModel].self, from: data)
            } catch {
                return []
            }
        }
        return []
    }
    
    static func save(_ results: [ResultModel]) {
        try? UserDefaults.standard.set(JSONEncoder().encode(results), forKey: key)
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: ResultModel) {
        appendInterpolation("Visual: \(value.visualCorrect)/\(value.visualCorrect+value.visualIncorrect), Audio \(value.audioCorrect)/\(value.audioCorrect+value.audioIncorrect)")
    }
}
