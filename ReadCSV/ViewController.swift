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
        view.addSubview(csvTable)
        csvTable.snp.makeConstraints { make in
          make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
          make.left.right.equalToSuperview()
          make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "iruyo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return csvContents.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = csvTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = csvContents[indexPath.row]
        cell.contentConfiguration = content
        print(cell.textLabel?.text ?? "何もない")

        return cell

    }
    

}
#Preview("UIKit") {
    ViewController()
}

