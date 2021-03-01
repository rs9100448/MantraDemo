//
//  Items.swift
//  Mantra
//
//  Created by Ravindra on 24/02/21.
//

import Foundation

struct Items : Codable, Hashable {
  let name : String
  let subCategory : [SubCategary]
  var isSelected = false
  
  enum CodingKeys : String, CodingKey {
    case name
    case subCategory = "sub_category"
  }
  
}
