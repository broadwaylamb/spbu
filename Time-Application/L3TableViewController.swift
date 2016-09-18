//
//  L3TableViewController.swift
//  Time-Application
//
//  Created by Даниил on 17.09.16.
//  Copyright © 2016 Daniil Gavrilov. All rights reserved.
//

import UIKit

class L3TableViewController: UITableViewController {

    var jsonURI: String!
    let representation = URepresentation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let target = UService.getData(path: jsonURI, onLevel: .l3)
        representation.loadDataWith(target) { result in
            self.tableView.reloadDataDependingOn(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return representation.data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group = representation.data[section] as! GroupedUDataElement
        return group.form
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = representation.data[section] as! GroupedUDataElement
        return group.groupedElements.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "l3Cell", for: indexPath)
        
        let dataElement = getDataElement(for: indexPath)
        
        cell.textLabel?.text = dataElement.title + dataElement.form

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! L4TableViewController
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let dataElement = getDataElement(for: indexPath)
        
        destination.jsonURI = dataElement.JSON_URI!
        
    }
    
    func getDataElement(for indexPath: IndexPath) -> UDataElementWithForm {
        let group = representation.data[indexPath.section] as! GroupedUDataElement
        let dataElement = group.groupedElements[indexPath.row]
        
        return dataElement
    }

}




