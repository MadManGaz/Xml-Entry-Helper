//
//  ViewController.swift
//  Xml Entry Helper
//
//  Created by Gary Moore on 16/02/2019.
//  Copyright © 2019 Gary Moore. All rights reserved.
//

import Cocoa
import Highlightr

class ViewController: NSViewController, NSPopoverDelegate {
    @IBOutlet weak var directorsButton: NSButton!
    @IBOutlet weak var genresButton: NSButton!
    @IBOutlet weak var castButton: NSButton!
    @IBOutlet weak var generateXmlButton: NSButton!
    
    public static var globalFilm = Film()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func popoverShouldDetach(_ popover: NSPopover) -> Bool {
        return true
    }
    
    @IBAction func onDirectorsButtonClicked(_ sender: NSButton) {
        let directorsPopover = NSPopover()
        let directorsContentViewController = DirectorsContentViewController()
        directorsPopover.behavior = .semitransient
        directorsPopover.contentViewController = directorsContentViewController
        directorsPopover.delegate = self
        
        directorsPopover.show(relativeTo: directorsButton.visibleRect,
                              of: directorsButton,
                              preferredEdge: .maxX)
    }
    
    @IBAction func onGenresButtonClicked(_ sender: NSButton) {
        let genresPopover = NSPopover()
        genresPopover.behavior = .semitransient
        genresPopover.animates = true
        genresPopover.contentViewController = GenresContentViewController()
        genresPopover.delegate = self
        
        genresPopover.show(relativeTo: genresButton.visibleRect,
                           of: genresButton,
                           preferredEdge: .maxX)
    }
    
    @IBAction func onCastButtonClicked(_ sender: NSButton) {
        let castPopover = NSPopover()
        castPopover.behavior = .semitransient
        castPopover.animates = true
        castPopover.contentViewController = CastContentViewController()
        castPopover.delegate = self
        
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
        testingPopover.delegate = self
        
        testingPopover.show(relativeTo: generateXmlButton.visibleRect,
                            of: generateXmlButton,
                            preferredEdge: .maxX)
        
        let filmXmlTool = FilmXmlTool(film: ViewController.globalFilm)
        
        if let xmlString = filmXmlTool.xmlString {
            let highlighter = Highlightr()
            highlighter?.setTheme(to: "xcode")
            if let highlightedXmlString = highlighter!.highlight(xmlString, as: "xml") {
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
}
