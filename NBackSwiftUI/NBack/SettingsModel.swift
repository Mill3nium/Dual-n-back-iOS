



import Foundation

enum GameSettings:Codable{
    case AUDIO
    case VISUAL
    case AUDIOANDVISUAL
}

struct SettingsModel: Codable{
    var numberOfEvents:Int = 10
    var timeBetweenEvents:Int = 3
    var gameSettings:GameSettings = GameSettings.VISUAL
}
