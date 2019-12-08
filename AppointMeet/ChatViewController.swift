//Completed by Mobeen Raza
// Concepts from Tutorials by London App Brewery were used here

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    var msgArray : [Message] = [Message]()
    
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendBtn: UIButton!
    @IBOutlet var msgTextfield: UITextField!
    @IBOutlet var msgTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        msgTableView.delegate = self
        msgTableView.dataSource = self
        
        msgTextfield.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableViewTap))
        msgTableView.addGestureRecognizer(tap)
        

        msgTableView.register(UINib(nibName: "MessageCell", bundle:nil), forCellReuseIdentifier: "customMessageCell")
        
        configTableView()
        getMessages()
        msgTableView.separatorStyle = .none
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = msgArray[indexPath.row].msgBody
        cell.senderUsername.text = msgArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        if cell.senderUsername.text == Auth.auth().currentUser?.email as String!{
            cell.avatarImageView.backgroundColor = UIColor.flatGreen()
            cell.messageBackground.backgroundColor = UIColor.flatRed()
        }
        else{
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatMagenta()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgArray.count
    }
    
    
    @objc func tableViewTap(){
        msgTextfield.endEditing(true)
    }
    
    
    func configTableView(){
        msgTableView.rowHeight = UITableViewAutomaticDimension
        msgTableView.estimatedRowHeight = 120.0
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.4){
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.4){
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        msgTextfield.endEditing(true)
        
        msgTextfield.isEnabled = false
        sendBtn.isEnabled  = false
        
        let msgDB = Database.database().reference().child("Messages")
        
        let msgDict = ["Sender": Auth.auth().currentUser?.email, "MessageBody": msgTextfield.text!]
        
        msgDB.childByAutoId().setValue(msgDict){
            (error, referenece) in
            
            if(error != nil){
                print(error!)
            }
            else{
                print("Message Saved")
                self.msgTextfield.isEnabled = true
                self.sendBtn.isEnabled  = true
                self.msgTextfield.text = ""
            }
        }
        
        
    }
    
    func getMessages(){
        let msgDB = Database.database().reference().child("Messages")
        msgDB.observe(.childAdded) { (snapshot) in
            let snapVal = snapshot.value as! Dictionary<String, String>
            let txt = snapVal["MessageBody"]!
            let sender = snapVal["Sender"]!
            
            let msg = Message()
            msg.msgBody = txt
            msg.sender = sender
            
            self.msgArray.append(msg)
            
            self.configTableView()
            self.msgTableView.reloadData()
        }
    }
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        do{
        try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
    }
        catch{
           print("Problem with signing out")
        }
    }
    


}
