//
//  Preferences.swift
//  SpotStatus
//
//  Created by Joshua Spicer on 4/2/19.
//  Copyright © 2019 Josh Spicer. All rights reserved.
//

import Cocoa

protocol PreferencesWindowDelegate {
    func preferencesDidUpdate()
}

class Preferences: NSWindowController, NSWindowDelegate {
    
    @IBOutlet weak var displayText: NSTextField!
    @IBOutlet weak var cleanSongTitle: NSButton!
    @IBOutlet weak var showArtist: NSButton!
    
    var delegate: PreferencesWindowDelegate?

    
    override var windowNibName : String! {
        return "Preferences"
    }
    
    override func windowDidLoad() {

        super.windowDidLoad()
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func windowWillClose(_ notification: Notification) {
        let defaults = UserDefaults.standard
        
        defaults.setValue(displayText.stringValue, forKey: "displayName")
        defaults.setValue(cleanSongTitle.state == .on, forKey: "cleanSongTitle")
        defaults.setValue(showArtist.state == .on, forKey: "showArtist")
        delegate?.preferencesDidUpdate()

    }
}
