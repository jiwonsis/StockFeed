import Foundation

struct Group: Equatable, Codable {
    var title : String
    var note: String?
    
    init(title: String, note: String? = nil) {
        self.title = title
        self.note = note
    }
}

func==(leftGroup: Group, rightGroup:Group) -> Bool {
    if leftGroup.title != rightGroup.title ||
        leftGroup.note != rightGroup.note {
        return false
        
    }
    return true
}
