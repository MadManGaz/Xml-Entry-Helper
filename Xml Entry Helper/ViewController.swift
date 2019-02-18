//
//  ViewController.swift
//  Xml Entry Helper
//
//  Created by Gary Moore on 16/02/2019.
//  Copyright © 2019 Gary Moore. All rights reserved.
//

import Cocoa
import Highlightr

class ViewController: NSViewController {
    @IBOutlet weak var directorsButton: NSButton!
    @IBOutlet weak var genresButton: NSButton!
    @IBOutlet weak var castButton: NSButton!
    @IBOutlet weak var generateXmlButton: NSButton!
    
    var directorsPopoverDelegate = DirectorsDelegate()
    var genresPopoverDelegate = GenresPopoverDelegate()
    var castPopoverDelegate = CastPopoverDelegate()
    var xmlButtonPopoverDelegate = XmlButtonPopoverDelegate()
    
    var film: Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        film = Film()
    }
    
    @IBAction func onDirectorsButtonClicked(_ sender: NSButton) {
        let directorsPopover = NSPopover()
        let directorsContentViewController = DirectorsContentViewController()
        directorsPopover.behavior = .semitransient
        directorsPopover.contentViewController = directorsContentViewController
        directorsPopover.delegate = directorsPopoverDelegate
        
        directorsPopover.show(relativeTo: directorsButton.visibleRect,
                              of: directorsButton,
                              preferredEdge: .maxX)
    }
    
    @IBAction func onGenresButtonClicked(_ sender: NSButton) {
        let genresPopover = NSPopover()
        genresPopover.behavior = .semitransient
        genresPopover.animates = true
        genresPopover.contentViewController = GenresContentViewController()
        
        genresPopover.show(relativeTo: genresButton.visibleRect,
                           of: genresButton,
                           preferredEdge: .maxX)
    }
    
    @IBAction func onCastButtonClicked(_ sender: NSButton) {
        let castPopover = NSPopover()
        castPopover.behavior = .semitransient
        castPopover.animates = true
        castPopover.contentViewController = CastContentViewController()
        castPopover.delegate = castPopoverDelegate
        
        castPopover.show(relativeTo: castButton.visibleRect,
                         of: castButton,
                         preferredEdge: .maxX)
    }
    
    @IBAction func onGenerateXmlButtonClicked(_ sender: NSButton) {
        let testingContentViewController = TestingContentViewController()
        let testingPopover = NSPopover()
        testingPopover.behavior = .semitransient
        testingPopover.animates = true
        testingPopover.contentViewController = testingContentViewController
        testingPopover.delegate = xmlButtonPopoverDelegate
        
        testingPopover.show(relativeTo: generateXmlButton.visibleRect,
                            of: generateXmlButton,
                            preferredEdge: .maxX)
        
        let film = Film()
        let filmXmlTool = FilmXmlTool(film: film)
        
        if let xmlString = filmXmlTool.xmlString {
            let highlighter = Highlightr()
            highlighter?.setTheme(to: "xcode")
            if let highlightedXmlString = highlighter!.highlight(xmlString,
                                                                 as: "xml") {
                testingContentViewController
                    .scratchpadLabel
                    .attributedStringValue = highlightedXmlString
            } else {
                testingContentViewController
                    .scratchpadLabel
                    .stringValue = xmlString
            }
        }
    }
    
    class DirectorsDelegate: NSObject, NSPopoverDelegate {
        func popoverShouldDetach(_ popover: NSPopover) -> Bool {
            return true
        }
        
        func popoverWillClose(_ notification: Notification) {
            
        }
    }
    
    class GenresPopoverDelegate: NSObject, NSPopoverDelegate {
        func popoverShouldDetach(_ popover: NSPopover) -> Bool {
            return true
        }
        
        func popoverWillClose(_ notification: Notification) {
            
        }
    }
    
    class CastPopoverDelegate: NSObject, NSPopoverDelegate {
        func popoverShouldDetach(_ popover: NSPopover) -> Bool {
            return true
        }
        
        func popoverWillClose(_ notification: Notification) {
            
        }
    }
    
    class XmlButtonPopoverDelegate: NSObject, NSPopoverDelegate {
        func popoverShouldDetach(_ popover: NSPopover) -> Bool {
            return true
        }
        
        func popoverWillClose(_ notification: Notification) {
            
        }
    }
}
