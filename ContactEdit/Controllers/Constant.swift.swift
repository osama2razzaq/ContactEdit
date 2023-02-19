//
//  GetContacts.swift
//  ContactEdit
//
//  Created by Esync on 19/02/2023.
//


import Foundation
import UIKit

var contactList: [ContactModel] = []
var currentIndex = 0
var fm = FileManager.default
var fresult: Bool = false
var subUrl: URL?
var mainUrl: URL? = Bundle.main.url(forResource: "data", withExtension: "json")
let themeColor = UIColor(red: 255/255.0, green: 140/255.0, blue: 0/255.0, alpha: 1)
