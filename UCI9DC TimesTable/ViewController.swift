//
//  ViewController.swift
//  UCI9DC TimesTable
//
//  Created by Stanislav Sidelnikov on 17/02/16.
//  Copyright © 2016 Stanislav Sidelnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let COUNT = 30
    private let NUMBER_DEF_KEY = "Number"
    
    @IBAction func numberChanged(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setFloat(numberSlider.value, forKey: NUMBER_DEF_KEY)
        
        numberLabel.text = String(format: "%d", Int(numberSlider.value))

        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let number = NSUserDefaults.standardUserDefaults().floatForKey(NUMBER_DEF_KEY)
        if number >= numberSlider.minimumValue && number <= numberSlider.maximumValue {
            numberSlider.value = number
        }
        numberChanged(self)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimesOfNumber")!
        
        let m = indexPath.row + 1
        let num = Int(numberSlider.value)
        cell.textLabel?.text = "\(num) * \(m) = \(num * m)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return COUNT
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

