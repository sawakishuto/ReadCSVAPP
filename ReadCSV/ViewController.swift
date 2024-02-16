//
//  ViewController.swift
//  ReadCSV
//
//  Created by 澤木柊斗 on 2024/02/16.
//

import UIKit

class ViewController: UIViewController {
    var csvContents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(csvTable)
        csvTable.snp.makeConstraints { c in
            c.centerX.equalToSuperview()
            c.leading.equalTo(0)
            c.trailing.equalTo(0)
            c.bottom.equalTo(0)
            
        }
        csvTable.register(csvTableCellTableViewCell.self, forCellReuseIdentifier: "cell")
        csvTable.dataSource = self
        csvTable.delegate = self
        guard let path = Bundle.main.path(forResource: "seichi", ofType: "csv") else {
            print("データソース不足")
            return
        }
        do {
             let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
             csvContents = csvString.components(separatedBy: .newlines)
        } catch {
            return
        }
        // Do any additional setup after loading the view.
    }


}

