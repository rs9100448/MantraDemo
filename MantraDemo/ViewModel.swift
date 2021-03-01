//
//  ViewModel.swift
//  MantraDemo
//
//  Created by Ravindra on 01/03/21.
//

import Foundation

struct ItemsVM {
  
  /// Description
  /// - Parameter fileURL: This is file location URL
  /// - Returns: Array of Items to loadData methods
  private func fetchDataFromJsonFile(_ fileURL : URL) -> [Items] {
    let data = try! Data(contentsOf: fileURL)
    let decoder = JSONDecoder()
    let products = try? decoder.decode([Items].self, from: data)
    return products!
  }
  
  
  /// Description
  /// - Returns:Array of Items
  func loadData() -> [Items]? {
    if let fileURL = Bundle.main.url(forResource: "menu", withExtension: "json") {
      return fetchDataFromJsonFile(fileURL)
    }
    return nil
  }

}
