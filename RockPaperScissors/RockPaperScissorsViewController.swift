//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Abhijit Mazumdar on 3/17/15.
//  Copyright (c) 2015 Abhijit Mazumdar. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    var match: RPSMatch!
    
    var history = [RPSMatch]()
    
    @IBAction func makeYourMove(sender: UIButton) {
        // Here the RPS enum holds a player's move
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.Rock)
            
        case self.paperButton:
            throwDown(RPS.Paper)
            
        case self.scissorsButton:
            throwDown(RPS.Scissors)
            
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }

    func throwDown(playersMove: RPS)
    {
        let computersMove = RPS()
        let match = RPSMatch(p1: playersMove, p2: computersMove)
        
        // Add match to the history
        history.append(match)
        
        // Get the Storyboard and ResultViewController
        var storyboard = UIStoryboard (name: "Main", bundle: nil)
        var resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultViewController") as ResultViewController
        
        // Communicate the match to the ResultViewController
        resultVC.match = match
        
        self.presentViewController(resultVC, animated: true, completion: nil)    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        //Notice that this code works for both Scissors and Paper
//        let controller = segue.destinationViewController as ResultViewController
//        controller.match = self.match
//    }
    
    @IBAction func showHistory(sender: AnyObject) {
        let storyboard = self.storyboard
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as HistoryViewController
        
        controller.history = self.history
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
}

