import Foundation

protocol ModelCodableStrategy {
    func encodeGroups() -> Data
    func decodeGroups(encodeData: Data)
}
