//
//  FourthViewController.swift
//  MyContactPicker
//
//  Created by OOPer in cooperation with shlab.jp, on 2015/10/24.
//
//

import UIKit
import ContactsUI

class FourthViewController: UIViewController, CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func showPicker(_: AnyObject) {
        
        let picker = CNContactPickerViewController()
        picker.displayedPropertyKeys = [CNContactEmailAddressesKey]
        picker.predicateForEnablingContact = NSPredicate(format: "emailAddresses.@count > 0")
        picker.predicateForSelectionOfContact = NSPredicate(value: false) //default
        picker.predicateForSelectionOfProperty = NSPredicate(format: "key == 'emailAddresses'")
        picker.delegate = self
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    
    //#MARK: CNContactPickerDelegate methods
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContactProperties contactProperties: [CNContactProperty]) {
        let contactPropertiesCount = contactProperties.count
        self.resultLabel.text = "Picked \(contactPropertiesCount) contact email(s)"
    }
}
