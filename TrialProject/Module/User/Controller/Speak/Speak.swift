//
//  Profile.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit
import ZKCarousel
class Speak: BaseController {

    
    
    @IBOutlet weak var carousel: ZKCarousel! = ZKCarousel()
    
    //    MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCarousel()
    }
    
    private func setupCarousel() {
        
        // Create as many slides as you'd like to show in the carousel
        let slide = ZKCarouselSlide(image: #imageLiteral(resourceName: "carApp"), title: " Car Service ", description: "A car service is a maintenance check-up thats carriedout at set time intervels atleast every year")
        let slide1 = ZKCarouselSlide(image: #imageLiteral(resourceName: "carServices"), title: "Engine Oil Replacement", description: "Routine oil and filter chnages help remove particles nand sludg and keep engine at peek condition")
        let slide2 = ZKCarouselSlide(image: #imageLiteral(resourceName: "completeService"), title: "Car Maintennace Application", description: "Easy to book your car service time and date thgrough mobile application")
        let slide3 = ZKCarouselSlide(image: #imageLiteral(resourceName: "oilService"), title: "Automobile Mechanic", description: "Variety of automobiles makes or either in a specific area or in a specific make of automobile")
        let slide4 = ZKCarouselSlide(image: #imageLiteral(resourceName: "carserviceLogo"), title: "Time and Maintennace", description: "We do not compromise on time and maintenance services")
        let slide5 = ZKCarouselSlide(image: #imageLiteral(resourceName: "carMechanics"), title: "Customer Care", description: "It is statement of commitment that tells customers that the company would do everything possible to ensure their happiness.")
        
        // Add the slides to the carousel
        self.carousel.slides = [slide, slide1, slide2, slide3, slide4, slide5]
        
        
        // You can optionally use the 'interval' property to set the timing for automatic slide changes. The default is 1 second.
        self.carousel.interval = 1.5
        
        // OPTIONAL - use this function to automatically start traversing slides.
        self.carousel.start()
        
        // OPTIONAL - use this function to stop automatically traversing slides.
        // self.carousel.stop()
    }

    
}
