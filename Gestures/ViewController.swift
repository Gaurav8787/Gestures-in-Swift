//
//  ViewController.swift
//  Gestures
//
//  Created by Gaurav on 22/09/17.
//  Copyright © 2017 Gaurav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var states:Array = [String]()
    var statesd = [String:String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        states.append("hello")
        states.append("ddd")
        
        statesd["df"] = "dfd"
        
        
        print(states)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
            print("called /(sender.view.state)")
        let number = sender.state.rawValue
        print(number)
        
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
    @IBAction func tapedSecondgesture(_ sender: UITapGestureRecognizer) {
        print("called second")
        
        let number = sender.state
        print(number)

    }

    @IBAction func rotateGesture(_ sender: UIRotationGestureRecognizer) {
        
        let number = sender.state
        print(number)

        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
        
    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        print("called gstt")
        
        let number = sender.state
        print(number)
    }
    
    
    @IBAction func swipepressed(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("right")
        case UISwipeGestureRecognizerDirection.left:
            print("left")
        case UISwipeGestureRecognizerDirection.up:
            print("up")
        case UISwipeGestureRecognizerDirection.down:
            print("down")

        default:
            break
        }
        
    }
    
    @IBAction func longpressed(_ sender: UILongPressGestureRecognizer) {
        print("long pressed")
        
    }
    
    @IBAction func dragpressed(_ sender: UIPanGestureRecognizer) {
        
        let translate = sender.translation(in: view)
        
        sender.setTranslation(.zero, in: view)
        
        print(translate)
        
        let imgView = sender.view as! UIImageView
        imgView.center = CGPoint(x: imgView.center.x+translate.x, y: imgView.center.y+translate.y)
        
        if sender.state == UIGestureRecognizerState.ended {
            print("ended true")
        }
        
        
    }
    @IBAction func screenEdgePanGeture(_ sender: UIScreenEdgePanGestureRecognizer) {
        print("edge pan called");
        
        let translate = sender.translation(in: view)
        
        sender.setTranslation(.zero, in: view)
        
        let imgView = sender.view as! UIImageView
        imgView.center = CGPoint(x: imgView.center.x+translate.x, y: imgView.center.y+translate.y)
        
        if sender.state == UIGestureRecognizerState.ended {
            print("ended true")
        }

        
        
    }
}

extension ViewController:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
}

