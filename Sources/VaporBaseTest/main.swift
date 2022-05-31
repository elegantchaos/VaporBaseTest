// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 31/05/2022.
//  All code (c) 2022 - present day, Sam Deane.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation
import LeafKit
import Vapor
import VaporBase

class TestSite: VaporBaseSite {
    override var name: String { "Test"}
    override var database: String { "vaporbasetest" }
    
    override open func setupSiteSources(_ app: Application, sources: LeafSources) throws {
        let path = Bundle.module.url(forResource: "Views", withExtension: nil)!.path
        print("Site-specific views path is: \(path)")
        let source = NIOLeafFiles(
            fileio: app.fileio,
            limits: [.toSandbox, .requireExtensions], // Heroku bundle files are inside `.swift-bin`, which can be mistaken for being invisible
            sandboxDirectory: path,
            viewDirectory: path
        )
        
        try sources.register(source: "site", using: source, searchable: true)
    }

}

let site = TestSite()
try site.run()
