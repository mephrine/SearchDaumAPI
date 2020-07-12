//
//  SearchCafe.swift
//  SearchApp
//
//  Created by Mephrine on 2020/07/12.
//  Copyright © 2020 Mephrine. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SearchResult: ALSwiftyJSONAble {
    let isEnd: Bool?
    let pageCount: Int?
    let totalCount: Int?
    let items: [SearchItem]?
    
    init?(jsonData: JSON) {
        self.isEnd = jsonData["meta"]["is_end"].bool
        self.pageCount = jsonData["meta"]["pageable_count"].int
        self.totalCount = jsonData["meta"]["total_count"].int
        self.items = jsonData["documents"].to(type: SearchItem.self) as? [SearchItem]
    }
}

fileprivate struct SearchItem: ALSwiftyJSONAble {
    let name: String? = ""
    let contents: String?
    let datetime: String?
    let thumbnail: String?
    let title: String?
    let url: String?
    
    init?(jsonData: JSON) {
        if let cafeName = jsonData["cafename"].string {
            self.name = cafeName
        }
        if let blogName = jsonData["blogname"].string {
            self.name = blogName
        }
        
        self.contents = jsonData["contents"].string
        self.datetime = jsonData["datetime"].string
        self.thumbnail = jsonData["thumbnail"].string
        self.title = jsonData["title"].string
        self.url = jsonData["url"].string
    }
}
