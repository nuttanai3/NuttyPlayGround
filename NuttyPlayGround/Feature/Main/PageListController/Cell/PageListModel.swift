//
//  PageListModel.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//

import Foundation

@objc open class PageListModel: NSObject {
    var pageName: String = ""
    var pageKey: String = ""
    var storyKey: String = ""
    override init() {}
    
    init(name: String, pageKey: String, storyKey: String) {
        self.pageName = name
        self.pageKey = pageKey
        self.storyKey = storyKey
    }
}
