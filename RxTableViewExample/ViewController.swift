//
//  ViewController.swift
//  RxTableViewExample
//
//  Created by Md. Kamrul Hasan on 5/23/18.
//  Copyright © 2018 Md. Kamrul Hasan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    let countryArray = ["Bangladesh", "India", "Pakistan", "Nepal", "Bhutan", "China", "Malaysia", "Myanmar", "Sri Lanka", "Saudi Arabia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        
        setupItems()
        setupCellTapHandling()
    }
    
    func setupItems() {
        
        tableView.register(UINib.init(nibName: "CountryCell", bundle: Bundle.main), forCellReuseIdentifier: "CountryCell")
        
        let countries = Observable.just(countryArray)
        countries.bind(to: self.tableView.rx.items(cellIdentifier: "CountryCell",
                                            cellType: CountryCell.self)) {
                                                row, country, cell in
                                                cell.countryLabel.text = country
        }
        .disposed(by: disposeBag)
        
    }
    
    private func setupCellTapHandling() {
        tableView
            .rx
            .modelSelected(String.self)
            .subscribe(onNext: {
                coutry in
                print("coutry tapped: ", coutry)
                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
}
