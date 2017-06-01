//
//  FourthViewController.swift
//  scrollTutorial
//
//  Created by Ola Roos on 01/06/17.
//  Copyright © 2017 Ola Roos. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: CustomScrollView!
    var previousOffset: CGFloat!
    var newTopFrame: CGRect!
    var newScrollFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        previousOffset = 0
    }
    
    func updateFrames(_ newOffset: CGFloat){
        let scale: CGFloat = 1.5
        print(topView.frame.height)
        if (topView.frame.height >= 0){
            let diff: CGFloat = (newOffset - previousOffset)/scale
            newTopFrame = CGRect(x: topView.frame.origin.x, y: topView.frame.origin.y, width: topView.frame.width, height: topView.frame.height - diff)
            newScrollFrame = CGRect(x: scrollView.frame.origin.x, y: scrollView.frame.origin.y - diff, width: scrollView.frame.width, height: scrollView.frame.height + diff)
            topView.frame = newTopFrame
            scrollView.frame = newScrollFrame
            previousOffset = newOffset
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y: CGFloat = scrollView.contentOffset.y
        updateFrames(y)
    }
}
