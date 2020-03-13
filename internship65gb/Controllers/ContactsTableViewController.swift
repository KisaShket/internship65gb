//
//  ContactsTableViewController.swift
//  internship65gb
//
//  Created by Miska  on 26.02.2020.
//  Copyright © 2020 Miska . All rights reserved.
//

import UIKit
import GoogleSignIn
import SDWebImage
class ContactsTableViewController: UITableViewController {
    let service = GoogleService()
    let network = Networker()
    var entrys = [Entry]()
    var imgUrl = [Link]()
    var imgUrlString = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        network.fetchContacts { contacts in
            let contact = contacts?.feed?.entry?.filter({type in type.galType!.type == "profile"})
            
            contact?.forEach{cont in
                let temp = cont.link?.filter{
                    $0.type == "image/*"
                }
                self.imgUrl.append(contentsOf: temp!)
            }
            self.entrys = contact!
            self.imgUrl.forEach { Link in
                self.imgUrlString.append(Link.href!)
            }
            self.tableView.reloadData()
        }
        
        
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return entrys.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "contactCell") as! CustomCell
        guard !entrys.isEmpty else {
            return cell
        }
        let token = service.getAccessToken()
        let contact = entrys[indexPath.row]
        let urls = URL(string: imgUrlString[indexPath.row]+"?access_token="+token!)
        cell.contactEmail.text = contact.gdEmail?[0].address
        cell.contactName.text = contact.gdName?.gdFullName?.t
        cell.contactPhone.text = contact.gdPhoneNumber?[0].t ?? "No phone number"
        cell.contactImage.sd_setImage(with: urls, completed: nil)
        return cell
    }
    
    @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        print("signed out")
    }
}
