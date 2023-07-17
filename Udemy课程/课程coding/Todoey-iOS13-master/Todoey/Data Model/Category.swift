//
//  Category.swift
//  Todoey
//
//  Created by Changjun Li on 2023/7/16.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    let items = List<Item>()
}
