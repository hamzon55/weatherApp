

import Foundation

protocol ServiceEnum {}

protocol Networking {
    associatedtype EnumType: ServiceEnum
    static func getService(from type: EnumType) -> Requestable
}
