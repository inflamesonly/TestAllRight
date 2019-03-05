//
//  ViewController.swift
//  TestAllRight
//
//  Created by macOS on 04.03.2019.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var questionTableView: UITableView!
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var seeAnswersButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    // MARK: variables
    let content = Content()
    
    var questionCell : QuestionCell?
    var answerCell : AnswerCell?
    
    var firstIndexPath : IndexPath?
    var secondIndexPath : IndexPath?
    
    var pairs : [Pair] = []
    var lines : [CAShapeLayer] = []
    
    private func disableTabelViews () {
        self.questionTableView.isUserInteractionEnabled = false
        self.answersTableView.isUserInteractionEnabled = false
    }
    
    private func enableTabelViews () {
        self.questionTableView.isUserInteractionEnabled = true
        self.answersTableView.isUserInteractionEnabled = true
    }
    
    // MARK: Actions
    @IBAction func check (_ sender : UIButton) {
        self.deselectAllRows()
        self.checkAnswer()
    }
    
    @IBAction func tryAgain (_ sender : UIButton) {
        self.removeLines(withGreen: false)
        self.removeRedPairs()
    }
    
    @IBAction func restart (_ sender : UIButton) {
        self.restart()
        self.enableTabelViews()
    }
    
    @IBAction func seeAnswers (_ sender : UIButton) {
        self.restart()
        self.seeAnswers()
        self.disableTabelViews()
    }
    
    // MARK: logick
    private func seeAnswers () {
        for (index, acceptPairs) in content.aceptedPairs.enumerated() {
            let firstCell = questionTableView.cellForRow(at: IndexPath(row: index, section: 0)) as! QuestionCell
            let firstPoint = self.getPoint(tableView: self.questionTableView, positionFrom: IndexPath(row: index, section: 0), isFirst: true)
            let cells = self.answersTableView.visibleCells
            for (index, _) in cells.enumerated() {
                let secondCell = answersTableView.cellForRow(at: IndexPath(row: index, section: 0)) as! AnswerCell
                if firstCell.questionImage.image == acceptPairs.image && acceptPairs.value == secondCell.answerLabel.text {
                    
                    let secondPoint = self.getPoint(tableView: self.answersTableView, positionFrom: IndexPath(row: index, section: 0), isFirst: false)
                    
                    self.addLine(fromPoint: firstPoint, toPoint: secondPoint, color: UIColor.yellow)
                }
            }
        }
    }
    
    private func checkAnswer () {
        for (index, myPair) in pairs.enumerated() {
            let line = lines[index]
            for acceptPairs in content.aceptedPairs {
                if acceptPairs == myPair {
                    line.strokeColor = UIColor.green.cgColor
                    line.name = Color.green.rawValue
                    break
                } else {
                    line.strokeColor = UIColor.red.cgColor
                    line.name = Color.red.rawValue
                }
            }
        }
    }
    
    private func removeLines (withGreen green : Bool) {
        if let layers = self.view.layer.sublayers {
            for (index , layer) in layers.enumerated().reversed() {
                if layer.name == defaultLine || layer.name == Color.red.rawValue || layer.name == Color.gray.rawValue {
                    self.view.layer.sublayers?[index].removeFromSuperlayer()
                }
                if green {
                    if layer.name == Color.green.rawValue {
                       self.view.layer.sublayers?[index].removeFromSuperlayer()
                    }
                }
            }
        }
    }
    
    private func restart () {
        self.pairs.removeAll()
        self.lines.removeAll()
        self.removeLines(withGreen: true)
        self.clear()
    }
    
    private func removeRedPairs () {
        for (index, myPair) in pairs.enumerated().reversed() {
            for acceptPairs in content.aceptedPairs {
                if acceptPairs != myPair {
                    lines.remove(at: index)
                    pairs.remove(at: index)
                    break
                }
            }
        }
        self.clear()
    }
    
    private func clear () {
        self.questionCell = nil
        self.answerCell = nil
        self.firstIndexPath = nil
        self.secondIndexPath = nil
        self.deselectAllRows()
    }
    
    private func deselectAllRows () {
        self.questionTableView.deselectAllRows(animated: true)
        self.answersTableView.deselectAllRows(animated: true)
    }
}
