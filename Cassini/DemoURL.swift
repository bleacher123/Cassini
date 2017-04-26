//
//  DemoURL.swift
//  Cassini
//
//  Created by teriyakibob on 2017/3/15.
//  Copyright © 2017年 hoodsound. All rights reserved.
//

import Foundation

struct DemoURL  {
    static let stanford = URL(string: "http://is1.mzstatic.com/image/thumb/Music/v4/ae/05/b1/ae05b16e-e2a5-7aa7-7c9e-bdb1b34107ac/source/1200x1200bb.jpg")
    
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Cassini": "http://is3.mzstatic.com/image/thumb/Music/v4/68/55/9f/68559f92-d8c0-0a38-20fe-17d580a8995d/source/2400x2400bb.jpg",
            "Earth":"http://is3.mzstatic.com/image/thumb/Music1/v4/f0/95/f6/f095f607-7fd6-8caa-0078-cc59546247be/source/2400x2400bb.jpg",
            "Saturn":"http://is4.mzstatic.com/image/thumb/Music22/v4/f3/84/bb/f384bb73-608b-bec4-9953-fd2ce11a0883/source/2400x2400bb.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key,value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
