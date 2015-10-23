//
//  FirstViewController.swift
//  MyContactPicker
//
//  Created by OOPer in cooperation with shlab.jp, on 2015/10/24.
//
//

import UIKit
import Contacts
import ContactsUI

class FirstViewController: UIViewController, CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func showPicker(_: AnyObject) {
        let picker = CNContactPickerViewController()
//        picker.displayedPropertyKeys = [CNContactEmailAddressesKey]
//        picker.predicateForEnablingContact = NSPredicate(format: "emailAddresses.@count > 0")
//        picker.predicateForSelectionOfContact = NSPredicate(format: "emailAddresses.@count == 1")
        picker.delegate = self
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    
    //#MARK: CNContactPickerDelegate methods
    
    // A selected contact is returned with this method.
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        let contactName = CNContactFormatter.stringFromContact(contact, style: .FullName) ?? "No Name"
        self.resultLabel.text = "Picked \(contactName)"
    }
    
    
}

