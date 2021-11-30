



import Foundation


struct SettingsModel: Codable{
    var numberOfEvents:Int = 10
    var timeBetweenEvents:Int = 3
    var audioStimuli:Bool = false
    var visualStimuli:Bool = true
}
