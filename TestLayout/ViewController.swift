//
//  ViewController.swift
//  TestLayout
//
//  Created by William Hu on 4/13/18.
//  Copyright © 2018 William Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = story.instantiateViewController(withIdentifier: "AViewController")
        let vc2 = story.instantiateViewController(withIdentifier: "BViewController")
        vc1.view.backgroundColor = UIColor.green
        vc2.view.backgroundColor = UIColor.red
        addContentView([vc1, vc2])
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: scrollView.frame.height)
    }

    func addContentView(_ viewControllers: [UIViewController]) {
        viewControllers.enumerated().forEach {
            addChildViewController($1)
            $1.view.frame = CGRect(x: UIScreen.main.bounds.width * CGFloat($0), y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            scrollView.addSubview($1.view)
            didMove(toParentViewController: $1)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

