//
//  Pass.swift
//  applewalletanimation
//
//  Created by André Martingo on 20/12/2024.
//

import SwiftUI

// MARK: Sample Card Model and Data
struct Pass: Identifiable{
    var id = UUID().uuidString
    var image: UIImage
    var name: String
}

var passes: [Pass] = [
    Pass(image: UIImage(named: "pass1")!, name: "Pass1"),
    Pass(image: UIImage(named: "pass2")!, name: "Pass2"),
    Pass(image: UIImage(named: "pass3")!, name: "Pass3"),
    Pass(image: UIImage(named: "pass4")!, name: "Pass4"),
    Pass(image: UIImage(named: "pass5")!, name: "Pass5"),
    Pass(image: UIImage(named: "pass6")!, name: "Pass6"),
    Pass(image: UIImage(named: "pass7")!, name: "Pass7"),
    Pass(image: UIImage(named: "pass8")!, name: "Pass8"),
    Pass(image: UIImage(named: "pass9")!, name: "Pass9"),
    Pass(image: UIImage(named: "pass10")!, name: "Pass10")
]
