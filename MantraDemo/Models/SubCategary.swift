//
//  SubCategary.swift
//  Mantra
//
//  Created by Ravindra on 24/02/21.
//

import Foundation

struct SubCategary : Codable, Hashable {
  let name : String
  let displayName : String
  
  enum CodingKeys : String, CodingKey {
    case name
    case displayName = "display_name"
  }

}
