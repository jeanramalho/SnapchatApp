//
//  UserListViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 08/04/25.
//
import Foundation
import UIKit
import FirebaseDatabase

class UsersListViewController: UIViewController {
    
    let contentView: UsersListView = UsersListView()
    
    var imageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        getUsers()
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func getUsers(){
        
        let database = Database.database().reference()
        let usuarios = database.child("usuarios")
        
        usuarios.observe(.childAdded) { snapShot in
            print(snapShot)
        }
    }
    
    private func setupContentView(){
        
        let usersListTableView = contentView.usersListTableView
        
        usersListTableView.dataSource = self
        usersListTableView.delegate = self
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

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
