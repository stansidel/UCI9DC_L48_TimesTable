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
    private var number = 0
    private var times = [String]()
    
    private let COUNT = 30
    private let NUMBER_DEF_KEY = "Number"
    
    @IBAction func numberChanged(sender: AnyObject) {
        number = Int(numberSlider.value)
        
        NSUserDefaults.standardUserDefaults().setFloat(numberSlider.value, forKey: NUMBER_DEF_KEY)
        
        numberLabel.text = String(format: "%d", number)
        times.removeAll()
        for i in 2...COUNT {
            times.append("\(number) x \(i) = \(i * number)")
        }
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let number = NSUserDefaults.standardUserDefaults().floatForKey(NUMBER_DEF_KEY)
        if number >= numberSlider.minimumValue && number <= numberSlider.maximumValue {
            numberSlider.value = number
        }
        // Do any additional setup after loading the view, typically from a nib.
        numberChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimesOfNumber")!
        
        if (times.count > indexPath.row) {
            cell.textLabel?.text = times[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

