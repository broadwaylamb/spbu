//
//  L1TableViewController.swift
//  Time-Application
//
//  Created by Даниил on 16.09.16.
//  Copyright © 2016 Daniil Gavrilov. All rights reserved.
//

import UIKit
import Result

class L1TableViewController: UITableViewController {

    let representation = URepresentation()
    
    let target = UService.getData(path: "root.json", onLevel: .l1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.setBackgroundColor()
        self.setupUI()
        
        representation.loadDataWith(target) { result in
            self.tableView.reloadDataDependingOn(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representation.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "l1Cell", for: indexPath)
        
        let faculty = representation.data[indexPath.row] as! UDataElement
            
        cell.textLabel?.text = faculty.title

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! L2TableViewController
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let faculty = representation.data[indexPath.row] as! UDataElement
        
        destination.jsonURI = faculty.JSON_URI!
        
    }
    
    func setupUI() {
        let navigationBar = self.navigationController!.navigationBar
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        
        navigationBar.backgroundColor = UColor.backgroundColor
        navigationBar.tintColor = UColor.greyContentColor
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        
    }

}



