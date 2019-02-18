//
//  DirectorsContentViewController.swift
//  Xml Entry Helper
//
//  Created by Gary Moore on 18/02/2019.
//  Copyright © 2019 Gary Moore. All rights reserved.
//

import Cocoa
import Highlightr

class DirectorsContentViewController: NSViewController, NSPopoverDelegate {
    @IBOutlet weak var directorTextField: NSTextField!
    @IBOutlet weak var directorsLabel: NSTextField!
    
    var directors = [String]()
    var highlightedDirectorsXmlString: NSMutableAttributedString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        directorsLabel.stringValue = ""
        highlightedDirectorsXmlString = NSMutableAttributedString()
    }
    
    func popoverShouldDetach(_ popover: NSPopover) -> Bool {
        return true
    }
    
    @IBAction func onAddButtonClicked(_ sender: NSButton) {
        if (directorTextField.stringValue != "") {
            let highlightr = Highlightr()
            highlightr?.setTheme(to: "xcode")
            let stringToHighlight =
                "<director>\(directorTextField.stringValue)</director>"
            
            if let highlightedString = highlightr!.highlight(stringToHighlight,
                                                             as: "xml") {
                highlightedDirectorsXmlString.append(highlightedString)
                highlightedDirectorsXmlString
                    .append(NSAttributedString(string: "\n"))
                directorsLabel.attributedStringValue =
                    highlightedDirectorsXmlString
            } else {
                directorsLabel.stringValue = stringToHighlight
            }
            
            directors.append(directorTextField.stringValue)
            directorTextField.stringValue = ""
        }
    }
}
