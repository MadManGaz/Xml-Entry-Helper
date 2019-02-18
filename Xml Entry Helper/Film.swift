//
//  Film.swift
//  Xml Entry Helper
//
//  Created by Gary Moore on 16/02/2019.
//  Copyright © 2019 Gary Moore. All rights reserved.
//

import Foundation

struct Film {
    var title: String
    var directors: [String]
    var genres: [String]
    var plot: String
    var cast: [Performer]
    
    struct Performer {
        var actor: String
        var role: String
    }
    
    init() {
        title = ""
        directors = []
        genres = []
        plot = ""
        cast = []
    }
}
