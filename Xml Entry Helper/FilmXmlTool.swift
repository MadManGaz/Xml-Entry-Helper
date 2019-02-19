//
//  FilmXmlTool.swift
//  Xml Entry Helper
//
//  Created by Gary Moore on 18/02/2019.
//  Copyright © 2019 Gary Moore. All rights reserved.
//

import Foundation

class FilmXmlTool {
    private var root: XMLElement
    private var xml: XMLDocument
    private var dtd: XMLDTD
    private var film: Film?
    var xmlString: String?
    
    init() {
        root = XMLElement(name: "root")
        xml = XMLDocument(rootElement: root)
        dtd = XMLDTD()
        
        root.addChild(XMLElement(name: "foo", stringValue: "bar"))
        
        self.xmlString = root.xmlString(options: .nodePrettyPrint)
    }
    
    init(film: Film) {
        self.film = film
        root = XMLElement(name: "film")
        xml = XMLDocument(rootElement: root)
        dtd = XMLDTD()
        
        
        root.addChild(XMLElement(name: "title", stringValue: film.title))
        
        let directors = XMLElement(name: "directors")
        for director in film.directors {
            directors.addChild(XMLElement(name: "director", stringValue: director))
        }
        root.addChild(directors)
        
        let genres = XMLElement(name: "genres")
        for genre in film.genres {
            genres.addChild(XMLElement(name: "genre", stringValue: genre))
        }
        root.addChild(genres)
        
        root.addChild(XMLElement(name: "plot", stringValue: film.plot))
        
        let cast = XMLElement(name: "cast")
        for performer in film.cast {
            let xmlPerformer = XMLElement(name: "performer")
            xmlPerformer.addChild(XMLElement(name: "actor", stringValue: performer.actor))
            xmlPerformer.addChild(XMLElement(name: "role", stringValue: performer.role))
            cast.addChild(xmlPerformer)
        }
        root.addChild(cast)
        
        self.xmlString = root.xmlString(options: .nodePrettyPrint)
    }
}
