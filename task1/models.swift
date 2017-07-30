//
// Created by Андрей on 30/07/2017.
// Copyright (c) 2017 Tiofx. All rights reserved.
//

import Foundation

class ShortBookDescription {
    var title: String
    var author: String
    var link: String?

    init(title: String, author: String, imageLink: String? = nil) {
        self.title = title
        self.author = author
        self.link = imageLink
    }
}