//
//  ViewControllerDataSource.swift
//  TestAllRight
//
//  Created by macOS on 05.03.2019.
//  Copyright © 2019 macOS. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == questionTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as! QuestionCell
            cell.configure(image: content.images[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell") as! AnswerCell
            cell.configure(text: content.answers[indexPath.row])
            return cell
        }
    }
}
