
import Foundation


struct PreferencesModel: Codable{
    var n: Int = 1
    var stimulations: Int = 21
    var interval: UInt64 = 3
    var visual: Bool = true
    var audio: Bool = false
    
    private init() { }
    
    private static let key = "Preferences"
    func save() {
        try! UserDefaults.standard.set(JSONEncoder().encode(self), forKey: PreferencesModel.key)
    }
    
    static func load() -> PreferencesModel {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                print("Loaded preferences")
                return try JSONDecoder().decode(PreferencesModel.self, from: data)
            } catch {
                print("Could not load preferences (1)")
                return PreferencesModel()
            }
        }
        print("Could not load preferences (2)")
        return PreferencesModel()
    }
}
