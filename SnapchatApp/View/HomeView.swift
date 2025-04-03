//
//  HomeView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var snapsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        addSubview(snapsTableView)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            snapsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            snapsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            snapsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            snapsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
