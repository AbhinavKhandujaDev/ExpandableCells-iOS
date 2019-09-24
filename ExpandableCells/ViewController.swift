//
//  ViewController.swift
//  ExpandableCells
//
//  Created by abhinav khanduja on 23/09/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

struct CellData {
    var isSectionOpen : Bool // section
    var isExpanded : Bool // cells
    var sectionTitle : String
    var sectionData : [String]
}

class ViewController: UITableViewController {
    
    var cellData = [CellData(isSectionOpen: false, isExpanded: true, sectionTitle: "section1", sectionData: ["cell1","cell2", "cell3"]),
                    CellData(isSectionOpen: false, isExpanded: true, sectionTitle: "section2", sectionData: ["cell4","cell5", "cell6"]),
                    CellData(isSectionOpen: false, isExpanded: true, sectionTitle: "section3", sectionData: ["cell7","cell8", "cell9"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cellData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !cellData[section].isExpanded {
            return 0
        }
        return cellData[section].sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellData[indexPath.section].sectionData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = SectionView()
        vw.isShown = cellData[section].isSectionOpen
        vw.hideShowBottomButton()
        vw.blueBtnTapped = { value in
            self.cellData[section].isSectionOpen = !value
        }
        
        vw.greenBtnTapped = {
            var indexPaths = [IndexPath]()
            
            for row in self.cellData[section].sectionData.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            let expanded = self.cellData[section].isExpanded
            self.cellData[section].isExpanded = !expanded
            
            if !self.cellData[section].isExpanded {
                tableView.deleteRows(at: indexPaths, with: .automatic)
            }else {
                tableView.insertRows(at: indexPaths, with: .automatic)
            }
        }
        return vw
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
}

