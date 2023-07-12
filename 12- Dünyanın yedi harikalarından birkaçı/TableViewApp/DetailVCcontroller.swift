//
//  DetailVCcontroller.swift
//  TableViewApp
//
//  Created by uludağ on 10.07.2023.
//

import UIKit

class DetailVCcontroller: UIViewController {

    
    
    @IBOutlet weak var landMarksNames: UILabel!
    
    
    @IBOutlet weak var landMarksImage: UIImageView!
    
    var selectLandMarksname = ""
    var selectLandMarksima = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landMarksNames.text = selectLandMarksname
        landMarksImage.image = selectLandMarksima
        
        
    }
    

    
    
    

}
