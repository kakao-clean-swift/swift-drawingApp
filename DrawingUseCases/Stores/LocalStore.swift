//
//  LocalStore.swift
//  DrawingUseCases
//
//  Created by jaychoi on 2022/07/11.
//

import Foundation
import DrawingShapes

public final class LocalStore: Storage {
    
    private(set) public var shapes: [Shape] = []
    
    public func add<S>(shape: S) async throws where S : Shape {
        
    }
}
