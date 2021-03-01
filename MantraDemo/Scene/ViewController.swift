//
//  ViewController.swift
//  MantraDemo
//
//  Created by Ravindra on 27/02/21.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView : UITableView!
  var items : [Items]?
  var itemVM = ItemsVM()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = UITableView.automaticDimension
    items = itemVM.loadData()
  }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return items?.count ?? 0
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let item = items?[section] {
      return item.isSelected ? item.subCategory.count : 0
    }else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
    cell.itemName.text = items?[section].name
    cell.btnOutlet.tag = section
    cell.expandableArrowImg.image = (items?[section].isSelected ?? false) ? #imageLiteral(resourceName: "downArrow") : #imageLiteral(resourceName: "rightArrow")
    cell.btnOutlet.addTarget(self, action: #selector(expandableArrowBtnAction(_:)), for: .touchUpInside)
    return cell
  }
  
  
  /// Description
  /// - Parameter sender: Selected Section Btn Action
  @objc func expandableArrowBtnAction(_ sender : UIButton) {
    let selected = items?[sender.tag].isSelected
    items?[sender.tag].isSelected = !( selected ?? false)
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let item = items?[indexPath.section], item.isSelected {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RowTableViewCell", for: indexPath) as! RowTableViewCell
      cell.sbName.text = item.subCategory[indexPath.row].name
      cell.sbDisplayName.text = item.subCategory[indexPath.row].displayName
      cell.selectionStyle = .none
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
}

