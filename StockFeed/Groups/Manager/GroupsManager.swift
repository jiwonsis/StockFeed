import UIKit

typealias Groups = [Group]

class GroupsManager {
    var groupsCount : Int { return groups.count }

    private var groups = [Group]()
    
    
    public func addGroup(group: Group) {
        groups.append(group)
    }
    
    func removeGroupAt(index: Int) {
        guard index < groups.count && index > -1 else { return }
        groups.remove(at: index)
    }
    
    func search(title: String) -> Bool {
        let index = groups.index(where: { $0.title == title })
        return index != nil ? true : false
    }
    
    func updataAt(group: Group, index: Int) {
        groups[index].title = group.title
        groups[index].note = group.note
    }
    
    func clearAllGroup() {
        groups.removeAll()
    }
    
    func groupsAt(index: Int) -> Group {
        return groups[index]
    }
    
}

extension GroupsManager: ModelCodableStrategy {
    func encodeGroups() -> Data {
        return try! PropertyListEncoder().encode(groups)
    }
    
    func decodeGroups(encodeData: Data) {
        groups = try! PropertyListDecoder().decode([Group].self, from: encodeData)
    }
    
    
}
