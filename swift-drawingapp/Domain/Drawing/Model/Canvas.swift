import Foundation

struct Canvas {
    var items: [DrawingComponentType]
    var selected: Selectable?
    
    init(items: [DrawingComponentType], selected: Selectable? = nil) {
        self.items = items
        self.selected = selected
    }
    
    @discardableResult
    mutating func addDrawingItem(item: DrawingComponentType) -> DrawingComponentType? {
        if !self.items.contains(where: { $0.identifier == item.identifier }) {
            self.items.append(item)
            return item
        }
        return nil
    }
    
    mutating func moveItem(id: UUID, to point: RelativePoint) -> Movable? {
        guard let targetIndex = self.items.firstIndex(where: { $0.identifier == id }),
              var movable = self.items.remove(at: targetIndex) as? Movable else {
            return nil
        }
        
        if movable.identifier == self.selected?.identifier {
            movable.move(to: point)
            self.addDrawingItem(item: movable)
            return movable
        }
        return nil
    }
    
    mutating func select(id: UUID, isSelected: Bool) -> Selectable? {
        if isSelected, let selectable = self.items.first(where: { $0.identifier == id }) as? Selectable {
            self.selected = selectable
            return selectable
        }
        
        if !isSelected && self.selected?.identifier == id {
            self.selected = nil
        }
        return nil
    }
}
