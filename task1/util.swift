//
// Created by Андрей on 30/07/2017.
// Copyright (c) 2017 Tiofx. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONLoader {
    private static let instance = JSONLoader(pathToFile: "testData")

    let pathToFile: String

    private init(pathToFile: String) {
        self.pathToFile = pathToFile
    }

    class func getShortBooksDescription() -> JSON {
        return instance.getShortBooksDescription()
    }

    func getShortBooksDescription() -> JSON {
        let path = Bundle.main.path(
                forResource: pathToFile,
                ofType: "json",
                inDirectory: "resource")

        let jsonData = try! String(contentsOfFile: path!)
        let json = JSON(parseJSON: jsonData)

        return json
    }
}


extension JSON {
    func toShortBooksDescription() -> ShortBookDescription {
        return ShortBookDescription(
                title: self["title"].string!,
                author: self["author"].string!,
                imageLink: self["link"].string!
        );
    }
}