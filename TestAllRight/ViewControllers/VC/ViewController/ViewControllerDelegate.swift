//
//  ViewControllerDelegate.swift
//  TestAllRight
//
//  Created by macOS on 05.03.2019.
//  Copyright © 2019 macOS. All rights reserved.
//

import Foundation
import UIKit

let defaultLine = "line"

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height/CGFloat(content.answers.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == questionTableView {
            self.firstIndexPath = indexPath
            self.questionCell = tableView.cellForRow(at: indexPath) as? QuestionCell
            guard self.answerCell == nil else {
                self.add(pair: Pair(value: self.answerCell!.answerLabel.text!, image: self.questionCell!.questionImage.image!))
                return
            }
        } else {
            self.answerCell = tableView.cellForRow(at: indexPath) as? AnswerCell
            self.secondIndexPath = indexPath
            guard self.questionCell == nil else {
                self.add(pair: Pair(value: self.answerCell!.answerLabel.text!, image: self.questionCell!.questionImage.image!))
                return
            }
        }
    }
    
    func add (pair : Pair) {
        if !self.findFinishedPairs(from: pair) {
            self.addLine(fromPoint: self.getPoint(tableView: self.answersTableView, positionFrom: self.secondIndexPath!, isFirst:false), toPoint: self.getPoint(tableView: self.questionTableView, positionFrom: self.firstIndexPath!, isFirst:true), color: UIColor.gray)
            pairs.append(pair)
            self.clearPropirties()
        }
    }
    
    func findFinishedPairs (from pair : Pair) -> Bool {
        var isFind = false
        for thisPair in pairs {
            if thisPair.value == pair.value || thisPair.image == pair.image {
                isFind = true
                break
            }
        }
        return isFind
    }
    
    func clearPropirties () {
        self.questionCell = nil
        self.answerCell = nil
    }
    
    func getPoint (tableView : UITableView, positionFrom : IndexPath, isFirst : Bool) -> CGPoint {
        let rec = tableView.rectForRow(at: positionFrom)
        let position = tableView.convert(rec, to: tableView.superview)
        var point = CGPoint()
        if isFirst {
            point = CGPoint(x: position.maxX, y: position.midY)
        } else {
            point = CGPoint(x: position.minX, y: position.midY)
        }
        
        return point
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint, color : UIColor) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = 1
        line.lineJoin = CAShapeLayerLineJoin.round
        line.name = defaultLine
        self.view.layer.addSublayer(line)
        self.lines.append(line)
    }
}
