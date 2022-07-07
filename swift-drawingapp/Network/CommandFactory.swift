//
//  CommandFactory.swift
//  swift-drawingapp
//
//  Created by bean Milky on 2022/07/04.
//

import Foundation

protocol CommandGeneratable {
    func command(type: Command.Header,
                 id: String,
                 data: Data?) -> Command
}

extension CommandGeneratable {
    func command(type: Command.Header) -> Command {
        command(type: type, id: "", data: nil)
    }
}

class CommandFactory: CommandGeneratable {
    func command(type: Command.Header,
                 id: String = "",
                 data: Data? = nil) -> Command {
        return Command(header: type, id: id, length: data?.count, data: data)
    }
}
