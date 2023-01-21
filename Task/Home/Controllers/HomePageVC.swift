//
//  HomePageVC.swift
//  Task
//
//  Created by Apple on 20/01/2023.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    let viewModel = HomePageViewModel()
    let activityView = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        showActivityIndicatory()
        tableView.delegate = self
        tableView.dataSource = self
        apiConfig()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    func showActivityIndicatory() {
        self.view.addSubview(activityView)
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: 80, height: 80) // Set X and Y whatever you want
        container.backgroundColor = .clear
        activityView.center = self.view.center
        container.addSubview(activityView)
        self.view.addSubview(container)
        activityView.startAnimating()
    }
    func apiConfig(){
        activityView.startAnimating()
        viewModel.getList {
            DispatchQueue.main.async {
                self.activityView.stopAnimating()
                self.tableView.reloadData()
            }
            
        } onError: { error in
            print(error)
        }

    }
   
}
extension HomePageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.homeRes?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        let dict = viewModel.homeRes?.articles[indexPath.row]
        cell.img.imageURLLoad(url: URL(string: dict?.image.src ?? "")!)
        cell.titleLbl.text = dict?.title
        cell.descLbl.attributedText = dict?.bodyHTML.htmlAttributedString()
        cell.descLbl.font = AppFont.font(type: .Regular, size: 15)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = viewModel.homeRes?.articles[indexPath.row]
        let vc = DescriptionWebViewVC()
        vc.htmlString = dict?.bodyHTML ?? ""
        let rootvc = UINavigationController(rootViewController: vc)
        self.present(rootvc, animated: true)
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
