// Carlos Castillo
// CIS 240 Mobile Apps Development
//  ViewController.swift
//  Dogs
//
//  Created by  on 11/9/20.
//

import UIKit

class ViewController: UIViewController {
    // properties
    @IBOutlet weak var dogBreedLabel: UILabel!
    @IBOutlet weak var myMainImageView: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var myMainGifView: UIImageView!
    
    var myDogArray : [Dog] = [] // declare Dog array
    var arrayPos : Int = 0  // declare arrayPos as the index value of the array

    override func viewDidLoad() {
        super.viewDidLoad()
        setInitValues() // call the function to initialize values for objects
    }
    
    func setInitValues()  // this function sets initial values for all objects
    {
        // create three dog objects
        var dachshundDog = Dog(imageParam: UIImage(named:"doxdog.png")!, descriptionParam: "Dachshunds were bred to hunt badgers.", gifParam:"dachshundflying") // CONSIDER CHANGING YOUR DESCRIPTION TO SOMETHING MORE INTERESTING
        var chihuahuaDog = Dog(imageParam: UIImage(named : "chihuahua-portrait.jpg")!, descriptionParam: "The Chihuahua originated in Mexico.", gifParam: "chihuahuadance")
        var corgiDog = Dog(imageParam: UIImage(named : "corgidog.jpg")!, descriptionParam: "The Corgis name means dwarf dog.", gifParam: "corgipaws")
        myDogArray = [dachshundDog, chihuahuaDog, corgiDog] // load the array with dog objects
        self.leftButton.setTitle("Previous", for: .normal) // Give a title to the left button
        self.rightButton.setTitle("Next", for: .normal) // give a title to the right button
        updateScreen() // call func to update screen objects
    }
    
    //left button press causes image to change to preceding image
    @IBAction func leftButtonPress(_ sender: Any)
    {
        if(arrayPos != 0) // if not at the first position
        {
            arrayPos -= 1 // decrease the position value
        }
        else // if at the first position
        {
            arrayPos = myDogArray.count - 1 // set position var to last pos value (this makes it circular)
        }
        updateScreen()
    }
    
    // right button press causes image to change to next image
    @IBAction func rightButtonPress(_ sender: Any)
    {
        if(arrayPos != myDogArray.count - 1) // if not at the end of the array
        {
            arrayPos += 1 // increase the position value
        }
        else // if at the end
        {
            arrayPos = 0 // set the position var to first pos value (makes it circular)
        }
        updateScreen()
    }
    
    func updateScreen()  // this function updates all screen objects
    {
        self.myMainImageView.contentMode = .scaleAspectFit // scale the image to fit the size of the image view
        self.myMainGifView.contentMode = .scaleAspectFill // scale the gif to fill the size of the image view
        self.myMainImageView.image = myDogArray[arrayPos].dogImage // update the current image
        self.dogBreedLabel.text = myDogArray[arrayPos].dogDescription // update the current description label
        self.myMainGifView.loadGif(name: myDogArray[arrayPos].dogGif) // update the current gif image
        
        // I obtained the loadGif method by using the Swift+Gif.swift file which contains code from github.  That swift file contains the code for the loadGif method that is contained inside the UIImageView class.  That code allows for me to include gifs in the project folder (such as dachshundflying.gif or corgipaws.gif) and use them from there.  That code allows for me to use loadGif in my Dog project and show off the dog gifs!  
    }
}
