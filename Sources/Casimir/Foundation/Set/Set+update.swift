import Foundation

public extension Set where Element: CustomDebugStringConvertible {
    mutating func update(ifContains element: Element, found closure: (inout Element) -> (), failure: (Error) -> ()) {
        guard let foundIndex = firstIndex(of: element) else {
            failure(ErrorInstance("Unable to find index for element (\(element.debugDescription))"))
            return
        }
        
        guard var removedElement = remove(foundIndex) else {
            failure(ErrorInstance("Unable to remove element at index (\(foundIndex)) (\(element.debugDescription))"))
            return
        }
        
        closure(&removedElement)
        insert(removedElement)
    }
}
