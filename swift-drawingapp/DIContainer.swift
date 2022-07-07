//
//  DIContainer.swift
//  swift-drawingapp
//
//  Created by kakao on 2022/07/04.
//

import Foundation

typealias DIKey = String

protocol DIRegisterable {
    var id: DIKey { get }
}

extension DIRegisterable {
    var id: DIKey {
        String(describing: type(of: self))
    }
}

protocol Container {
    func register(_ object: DIRegisterable)
    func resolve<T>(for object: DIRegisterable.Type) -> T?
    func removeAll()
}

class DIContainer: Container {
    internal static let shared = DIContainer()
    private init() { }
    
    var objects = [DIKey: DIRegisterable]()
    
    // MARK: - DIRegistable
    func register(_ object: DIRegisterable) {
        self.objects[object.id] = object
    }
    
    func resolve<T>(for object: DIRegisterable.Type) -> T? {
        objects[String(describing: type(of: object))] as? T
    }
    
    func removeAll() {
        objects.removeAll()
    }
}
