//
//  myDogClass.swift
//  Dogs
//
//  Created by  on 11/9/20.
//

import UIKit

class Dog
{
    // properties
    var dogImage : UIImage
    var dogDescription : String
    var dogGif : String
    // methods
    init(imageParam : UIImage, descriptionParam : String, gifParam : String)
    {
        self.dogImage = imageParam
        self.dogDescription = descriptionParam
        self.dogGif = gifParam
    }
    
}
