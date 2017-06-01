//
//  ViewController.swift
//  scrollTutorial
//
//  Created by Ola Roos on 31/05/17.
//  Copyright © 2017 Ola Roos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView1: CustomScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        scrollView1.delegate = self
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView1.contentOffset)
        print("l;ajsdflskjdf")
    }

}

