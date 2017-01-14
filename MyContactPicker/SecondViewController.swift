//
//  SecondViewController.swift
//  MyContactPicker
//
//  Created by OOPer in cooperation with shlab.jp, on 2015/10/24.
//
//

import UIKit
import ContactsUI

class SecondViewController: UIViewController, CNContactPickerDelegate {

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
        picker.displayedPropertyKeys = [CNContactEmailAddressesKey]
        picker.predicateForEnablingContact = NSPredicate(format: "emailAddresses.@count > 0")
        picker.predicateForSelectionOfContact = NSPredicate(format: "emailAddresses.@count == 1")
        //picker.predicateForSelectionOfProperty = NSPredicate(format: "key == 'emailAddresses'")
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
    
    
    //#MARK: CNContactPickerDelegate methods
    
    // A selected contact is returned with this method.
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        assert(contact.emailAddresses.count == 1)
        let emailAddress = contact.emailAddresses[0].value as String
        
        self.resultLabel.text = "Picked \(emailAddress)"
    }
    
    // A selected property is returned with this method.
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        let emailAddress = (contactProperty.value as? String) ?? "no email address"
        
        self.resultLabel.text = "Picked \(emailAddress)"
    }
    
    
}

