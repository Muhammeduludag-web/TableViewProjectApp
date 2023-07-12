//
//  ViewController.swift
//  TableViewApp
//
//  Created by uludağ on 10.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewController: UITableView!
    
    var landMarks = [String]()
    var imageLandMarks = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkimage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController.delegate = self
        tableViewController.dataSource = self
        
        
        landMarks.append("Colosseum")
        landMarks.append("Greatwall")
        landMarks.append("Kapadokya")
        landMarks.append("Stonehenge")
        landMarks.append("TacMahal")
        
        
        
        imageLandMarks.append(UIImage(named: "colosseum.jpeg")!)
        imageLandMarks.append(UIImage(named: "Greatwall.jpeg")!)
        imageLandMarks.append(UIImage(named: "Kapadokya.jpeg")!)
        imageLandMarks.append(UIImage(named: "Stonehenge.jpeg")!)
        imageLandMarks.append(UIImage(named: "TacMahal.jpeg")!)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "TEST"
        var content = cell.defaultContentConfiguration()
        content.text = landMarks[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landMarks[indexPath.row]
        chosenLandMarkimage = imageLandMarks[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailVCcontroller
            destinationVC.selectLandMarksname = chosenLandMarkName
            destinationVC.selectLandMarksima = chosenLandMarkimage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landMarks.remove(at: indexPath.row)
            self.imageLandMarks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    

}

