//
//  ViewController.swift
//  GraphQLDemo
//
//  Created by Mishra, Sunil on 6/17/18.
//  Copyright © 2018 Mishra, Sunil. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UITableViewController {
    
    private let apollo = ApolloClient(url: URL(string: "http://10.0.0.52:8080/graphql")!)
    
    private var allMessageList = [MessageQueryQuery.Data.AllMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GraphQL Demo"
        
        let myQuery = MessageQueryQuery()
        apollo.fetch(query: myQuery) { (result, error) in
            self.allMessageList = result?.data?.allMessage as! [MessageQueryQuery.Data.AllMessage]
            self.tableView.reloadData()
            print("Message Count = \(self.allMessageList.count)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allMessageList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
            as! MessageViewCell
        let message = allMessageList[indexPath.row]
        cell.subjectLabel.text = message.subject
        cell.descriptionLabel.text = message.description
        cell.descriptionLabel.adjustsFontSizeToFitWidth = true
        cell.categoryLabel.text = "Category: \(String(describing: message.category!))"
       
        if let sender = message.sender {
            cell.categoryLabel.text = "Sender: \(String(describing: sender.firstName!))"
        }

        return cell
    }
    
    @IBAction func onButtonClicked(_ sender: Any) {
        let subject = "Apollo GraphQL in IOS Demo with : " + String(arc4random())
        let description = "It allows you to execute queries and mutations against a GraphQL server, and returns results as query-specific Swift types."
        let category = "primary"
        let createMessageMutation = MessageCreatorMutation(subject: subject, description: description, category: category, senderEmail:"abc_2@gmail.com")
        apollo.perform(mutation: createMessageMutation) {(result, error) in
            let messageId = result?.data?.createMessage
            print("messageId \(messageId!)")
            var newMessage = MessageQueryQuery.Data.AllMessage()
            newMessage.id = messageId!
            newMessage.subject = subject
            newMessage.description = description
            newMessage.category = category
            self.allMessageList.append(newMessage)
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

