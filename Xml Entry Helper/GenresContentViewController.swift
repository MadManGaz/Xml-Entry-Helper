//
//  GenresContentViewController.swift
//  Xml Entry Helper
//
//  Created by Gary Moore on 18/02/2019.
//  Copyright © 2019 Gary Moore. All rights reserved.
//

import Cocoa
import Highlightr

class GenresContentViewController: NSViewController {
    @IBOutlet weak var genreTextField: NSTextField!
    @IBOutlet weak var xmlContentTextField: NSTextField!
    
    var highlightedXmlAttributedString = NSMutableAttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        xmlContentTextField.stringValue = ""
    }
    @IBAction func onAddButtonClick(_ sender: NSButton) {
        if genreTextField.stringValue != "" {
            let highlightr = Highlightr()
            highlightr?.setTheme(to: "xcode")
            
            let stringToHighlight = "<genre>\(genreTextField.stringValue)</genre>"
            
            if let highlightedString = highlightr!.highlight(stringToHighlight) {
                highlightedXmlAttributedString.append(highlightedString)
                highlightedXmlAttributedString.append(NSAttributedString(string: "\n"))
                xmlContentTextField.attributedStringValue = highlightedXmlAttributedString
            } else {
                xmlContentTextField.stringValue = stringToHighlight
            }
            
            genreTextField.stringValue = ""
        }
    }
    
}
