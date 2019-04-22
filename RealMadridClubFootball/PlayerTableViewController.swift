//
//  PlayerTableViewController.swift
//  RealMadridClubFootball
//
//  Created by Georgy Jose on 16/02/2019.
//  Copyright © 2019 Georgy Jose. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController , XMLParserDelegate {
    
    @IBOutlet var playerTable: UITableView!
    
    var playerInfo = [Player]()
    
    var tagName = ""
    var playerName = ""
    var playerJersey = ""
    var playerPosition = ""
    var playerImage = ""
    var playerText = ""
    var playerUrl = ""
    var playerDob = ""
    var playerNationality = ""
    var playerHeight = ""
    var playerWeight = ""
    var playerPicture = ""
    
  // Initializing the Player List
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Player List"
        
        if let path = Bundle.main.url(forResource: "players", withExtension: "xml"){
            if let parser = XMLParser(contentsOf: path){
                parser.delegate = self
                parser.parse()
            }
        }
        
        print(playerInfo.count)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return playerInfo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
   //     let playerInfo = playerData.playerInfo(index :indexPath.row)
        cell.textLabel!.text = playerInfo[indexPath.row].name
        cell.detailTextLabel?.text = playerInfo[indexPath.row].position
        cell.imageView!.image = UIImage(named: playerInfo[indexPath.row].image)
        
        
        return cell
    }
    
    // XMLParser
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        tagName = elementName
        
        if(elementName == "player"){
            var playerName = ""
            var playerJersey = ""
            var playerPosition = ""
            var playerImage = ""
            var playerText = ""
            var playerUrl = ""
            var playerDob = ""
            var playerNationality = ""
            var playerHeight = ""
            var playerWeight = ""
            var playerPicture = ""
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {

        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if data.count != 0{
            switch tagName
            {
                case "name" : playerName = data
                case "jersey" : playerJersey = data
                case "position": playerPosition = data
                case "image": playerImage = data
                case "text" : playerText = data
                case "url" : playerUrl = data
                case "dob" : playerDob = data
                case "nationality": playerNationality = data
                case "height": playerHeight = data
                case "weight" : playerWeight = data
                case "pic" : playerPicture = data
                default:
                break
                
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "player"{
            
            var playerData = Player()
            playerData.name = playerName
            playerData.jersey = playerJersey
            playerData.position = playerPosition
            playerData.image = playerImage
            playerData.text = playerText
            playerData.url = playerUrl
            playerData.dob = playerDob
            playerData.nationality = playerNationality
            playerData.height = playerHeight
            playerData.weight = playerWeight
            playerData.picture = playerPicture
            
            playerInfo.append(playerData)
        }
        
    }
    
    
    
    //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        let destination = segue.destination as! PlayerImageViewController
        // Pass the selected object to the new view controller.
        
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
        
        destination.playerInfo = playerInfo[indexPath!.row]
    }
    

}
