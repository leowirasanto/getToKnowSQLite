//
//  ViewController.swift
//  GetToKnowSQLite
//
//  Created by Leo on 24/07/20.
//  Copyright © 2020 leowirasanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let cellReusableIdentifier = "cell"

    var db:DBHelper = DBHelper()

    var persons: [Person] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReusableIdentifier)
        tableView.delegate = self
        tableView.dataSource = self

        db.insert(id: 1, name: "Leo", age: 25)
        db.insert(id: 2, name: "Tania", age: 22)
        db.insert(id: 3, name: "Eko", age: 30)
        db.insert(id: 4, name: "Edward", age: 44)
        db.insert(id: 5, name: "Ronald", age: 22)

        persons = db.read()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReusableIdentifier) else { return UITableViewCell() }
        cell.textLabel?.text = "Name: \(persons[indexPath.row].name), Age: \(persons[indexPath.row].age)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {

}
