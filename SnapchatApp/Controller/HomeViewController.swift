//
//  HomeViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let contentView: HomeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupNavigationBar()
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupNavigationBar(){
        
        self.title = "Snaps"
            
            if let navigationbar = navigationController?.navigationBar {
                
                let navigationBarLayout = UINavigationBarAppearance()
                navigationBarLayout.configureWithOpaqueBackground()
                navigationBarLayout.backgroundColor = .clear
                
                let fontAttributes = [
                    NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .medium)
                ]
                
                navigationBarLayout.titleTextAttributes = fontAttributes
                
                navigationbar.standardAppearance = navigationBarLayout
                navigationbar.scrollEdgeAppearance = navigationBarLayout
                navigationbar.compactAppearance = navigationBarLayout
                
                navigationbar.tintColor = .systemBlue
                
                navigationItem.leftBarButtonItem = UIBarButtonItem(
                    title: "Sair",
                    style: .plain,
                    target: self,
                    action: nil
                )
                
                navigationItem.rightBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "camera"),
                    style: .plain,
                    target: self,
                    action: nil
                )
            }
            
        }
    
    private func setupContentView(){
        
        let snapsTableView = contentView.snapsTableView
        
        snapsTableView.dataSource = self
        snapsTableView.delegate = self
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
