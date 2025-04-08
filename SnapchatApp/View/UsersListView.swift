//
//  UserListView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 08/04/25.
//
import Foundation
import UIKit

class UsersListView: UIView {
    
    lazy var usersListTableView: UITableView = {
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
    
    private func setupUI() {
        
        backgroundColor = .white
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(usersListTableView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            usersListTableView.topAnchor.constraint(equalTo: topAnchor),
            usersListTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            usersListTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            usersListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
