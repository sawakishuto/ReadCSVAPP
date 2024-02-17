//
//  ViewController.swift
//  ReadCSV
//
//  Created by 澤木柊斗 on 2024/02/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var csvContents: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        csvTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        csvTable.dataSource = self
        csvTable.delegate = self
        view.addSubview(csvTable)
        csvTable.snp.makeConstraints { c in
            c.centerX.equalToSuperview()
            c.leading.equalTo(0)
            c.trailing.equalTo(0)
            c.bottom.equalTo(0)
            
        }

        guard let path = Bundle.main.path(forResource: "seichi", ofType: "csv") else {
            print("データソース不足")
            return
        }
        do {
             let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
             csvContents = csvString.components(separatedBy: .newlines)
            print(csvContents)
        } catch {
             print("無理がある")
            return
        }

        // Do any additional setup after loading the view.
    }

    lazy var csvTable: UITableView = {
        let csvTable = UITableView()
        csvTable.translatesAutoresizingMaskIntoConstraints = false
        return csvTable
    }()
}
extension ViewController: UITableViewDelegate {

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = csvTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = csvContents[indexPath.row]
        cell.contentConfiguration = content

        return cell

    }
    

}
#Preview("UIKit") {
    ViewController()
}

