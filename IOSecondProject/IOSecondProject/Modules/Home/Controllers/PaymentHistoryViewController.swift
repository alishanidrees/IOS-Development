//
//  PaymentHistoryViewController.swift
//  IOSecondProject
//
//  Created by Ali Shan on 13/11/2023.
//

import UIKit

class PaymentHistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()

    var parterns:[Partner] = []
    
//    var paymentHistory: [PaymentHistory] = [
//        PaymentHistory(name: "Muhammad Abdullah", date: "Tuesday, 16 Nov 2021", price: "SAR 150", profileImage: UIImage(named: "ic_profile")!),
//        PaymentHistory(name: "Muhammad Abdullah", date: "Tuesday, 16 Nov 2021", price: "SAR 250", profileImage: UIImage(named: "ic_profile")!),
//        PaymentHistory(name: "Muhammad Abdullah", date: "Tuesday, 16 Nov 2021", price: "SAR 350", profileImage: UIImage(named: "ic_profile")!)
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        callHomeApi()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar
    }
    @objc private func popToPrevious() {
        // our custom stuff
        navigationController?.popViewController(animated: true)
    }
    private func callHomeApi(){
        HomeIntractor.shared.home(completion: { (response,error) in
            self.parterns = response?.data?.partners ?? []
            self.tableView.reloadData()
        })
    }
}
extension PaymentHistoryViewController {
    func prepareView() {
        registerCell()
        prepareDelegate()
        pullToRefresh()
    }
    
    func prepareDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func registerCell() {
        self.tableView.contentInset =  .init(top: 20, left: 0, bottom: 0, right: 0)
        self.tableView.registerCell(type: PaymentHistoryTableViewCell.self,
                               identifier: PaymentHistoryTableViewCell.identifier)
    }
    func pullToRefresh() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
      
    }
    func setNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Payment History"
        self.navigationController?.navigationBar.tintColor = UIColor(hex: "#137096")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back_arrow"),
        style: .plain, target: self, action: #selector(popToPrevious))
    }
    
    private func removeCellData(indexPath:IndexPath) {
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
    }
    private func addCellData(indexPath:IndexPath) {
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
    }
    
    private func updateCellData(indexPath:IndexPath) {
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
    }
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        callHomeApi()
        self.refreshControl.endRefreshing()
    }

}

extension PaymentHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parterns.count
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//        {
//            return 100.0//Choose your custom row height
//        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PaymentHistoryTableViewCell.identifier, for: indexPath
        ) as? PaymentHistoryTableViewCell else {
            return UITableViewCell()
        }
        cell.configureData(partner: parterns[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
  
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeCell = UIContextualAction(style: .normal, title: "Delete", handler: {action,view,completionHandler in
            let indexPath = IndexPath(row: indexPath.row, section: 0)
            self.parterns.remove(at: indexPath.row)
            self.removeCellData(indexPath: indexPath)
            completionHandler(true)
        })
        
        let addCell = UIContextualAction(style: .normal, title: "Add", handler: {action,view,completionHandler in
            self.parterns.append(Partner(id: "1313131", name: "Test", identifier: "123", type: "Partner", description: "Test Desc", image: "https://joodstorageuat.blob.core.windows.net/profile-image/9d9d8928019c424eaa6238de066124d6", bannerImage: "https://joodstorageuat.blob.core.windows.net/profile-image/9d9d8928019c424eaa6238de066124d6", termsAndConditions: "test terms", userID: "12345", totalNoOfReviews: 10, averageRating: 5, locations: [Location(name: "location name", latitude: 10.0, longitude: 20.0, locationCode: "123", address: "test")]))
            let indexPath = IndexPath(row: indexPath.row, section: 0)
            self.addCellData(indexPath: indexPath)
            completionHandler(true)
        })
        let updateCell = UIContextualAction(style: .normal, title: "Update", handler: {action,view,completionHandler in
            self.parterns.insert((Partner(id: "1313131", name: "Test", identifier: "123", type: "Partner", description: "Test Desc", image: "https://joodstorageuat.blob.core.windows.net/profile-image/9d9d8928019c424eaa6238de066124d6", bannerImage: "https://joodstorageuat.blob.core.windows.net/profile-image/9d9d8928019c424eaa6238de066124d6", termsAndConditions: "test terms", userID: "12345", totalNoOfReviews: 10, averageRating: 5, locations: [Location(name: "location name", latitude: 10.0, longitude: 20.0, locationCode: "123", address: "test")])), at: indexPath.row)
            let indexPath = IndexPath(row: indexPath.row, section: 0)
            self.updateCellData(indexPath: indexPath)
            completionHandler(true)
        })
        removeCell.backgroundColor = .systemRed
        addCell.backgroundColor = .systemBlue
        updateCell.backgroundColor = .systemGreen
        let swipeAction = UISwipeActionsConfiguration(actions: [removeCell,addCell,updateCell])
        // it restric to delete the cell from full swipe
        swipeAction.performsFirstActionWithFullSwipe = false
       // swipeAction.action = marginView

        return swipeAction
    }
    
}
