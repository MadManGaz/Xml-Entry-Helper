//
//  TestingContentViewController.swift
//  Xml Entry Helper
//
//  Created by Gary Moore on 18/02/2019.
//  Copyright © 2019 Gary Moore. All rights reserved.
//

import Cocoa

class TestingContentViewController: NSViewController, NSPopoverDelegate {
    @IBOutlet weak var scratchpadLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func popoverShouldDetach(_ popover: NSPopover) -> Bool {
        return true
    }
    
}
