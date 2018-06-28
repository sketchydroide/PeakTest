//
//  ViewController.swift
//  test
//
//  Created by Andre_Fonseca on 10/12/2017.
//  Copyright © 2017 Andre_Fonseca. All rights reserved.
//

import UIKit
import CoreGraphics

enum Groups: String {
    case yours = "You"
    case ageGroup = "Age Group"
    case profession = "Profession"
}

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: GradientView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var peakTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var share: UILabel!
    @IBOutlet weak var shareImage: UIImageView!
    @IBOutlet weak var categoriesSegmentControl: UISegmentedControl!
    @IBOutlet weak var mapView: BrainMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
        shareImage.image = shareImage.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        shareImage.tintColor = UIColor.PeakColor.Grey.regular
        
        backgroundView.topColor = UIColor.PeakColor.Grey.topBackground
        backgroundView.bottomColor = UIColor.PeakColor.Grey.bottomBackground
        backgroundView.setNeedsDisplay()
        
        screenTitle.font = Fonts.screenTitle
        peakTitle.font = Fonts.peakTitle
        descriptionLabel.font = Fonts.description
        share.font = Fonts.share
        
        screenTitle.attributedText = Text.screenTitle.rawValue.localize().attributedStringForScreenTitle()
        peakTitle.attributedText = Text.peakTitle.rawValue.localize().attributedStringForMapTitle()
        descriptionLabel.attributedText = Text.description.rawValue.localize().attributedStringForDescription()
        share.attributedText = Text.share.rawValue.localize().attributedStringForShare()
        
        categoriesSegmentControl.setTitle(Groups.yours.rawValue.localize(), forSegmentAt: 0)
        categoriesSegmentControl.setTitle(Groups.ageGroup.rawValue.localize(), forSegmentAt: 1)
        categoriesSegmentControl.setTitle(Groups.profession.rawValue.localize(), forSegmentAt: 2)
        
        let brainScoreRepository = BrainScoreRepository()
        
        guard let myBrainMap = brainScoreRepository.myBrainMap,
            let ageGroupMap = brainScoreRepository.ageGroupMap,
            let professionMap = brainScoreRepository.professionMap else {
                return
        }
        
        mapView.setup(myBrainMap: myBrainMap,
                      ageGroupMap: ageGroupMap,
                      professionMap: professionMap)
    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        let group: Groups
        switch sender.selectedSegmentIndex {
        case 0:
            group = Groups.yours
        case 1:
            group = Groups.ageGroup
        case 2:
            group = Groups.profession
        default:
            group = Groups.yours
        }
        mapView.showGraph(group: group)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
