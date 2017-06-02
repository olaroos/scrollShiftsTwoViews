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
    @IBOutlet weak var scrollSubView: UIView!
    
    var newTopFrame: CGRect!
    var newScrollFrame: CGRect!
    
    var scale: CGFloat!
    var previousOffset: CGFloat!
    var defaultTopHeight: CGFloat!
    var first: Bool!
    
    var defaultScrollHeight: CGFloat!
    var maxScrollOffset: CGFloat!
    var maxScale: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        scale = 4
        previousOffset = 0
        defaultTopHeight = topView.frame.height
        first = true
    }
    
    func updateFrames(_ newOffset: CGFloat){
        let diff: CGFloat = (newOffset - previousOffset)/scale
        if (newOffset/scale <= defaultTopHeight){
            newTopFrame = CGRect(x: topView.frame.origin.x, y: topView.frame.origin.y, width: topView.frame.width, height: topView.frame.height - diff)
            newScrollFrame = CGRect(x: scrollView.frame.origin.x, y: scrollView.frame.origin.y - diff, width: scrollView.frame.width, height: scrollView.frame.height + diff)
            previousOffset = newOffset
        } else {
            newTopFrame = CGRect(x: topView.frame.origin.x, y: topView.frame.origin.y, width: topView.frame.width, height: 0)
            newScrollFrame = CGRect(x: scrollView.frame.origin.x, y: 0, width: scrollView.frame.width, height: defaultScrollHeight + defaultTopHeight)
            previousOffset = defaultTopHeight*scale
        }
        topView.frame = newTopFrame
        scrollView.frame = newScrollFrame
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (first == true){
            // for some reason scrollView.frame.height takes on the right value after viewDidLoad() is run
            defaultScrollHeight = scrollView.frame.height
            maxScrollOffset = defaultTopHeight + defaultScrollHeight
            maxScale = (scrollSubView.frame.height - (defaultTopHeight + defaultScrollHeight))/defaultTopHeight
            if (scale > maxScale){
                print(maxScale)
                scale = maxScale
            }
            first = false
        }
        updateFrames(scrollView.contentOffset.y)
    }
}
