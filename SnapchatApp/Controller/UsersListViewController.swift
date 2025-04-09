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
    var descritionSnap: String?
    var usuarios: [Usuario] = []
    
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
            
            // Transforma snapshot em um array com os dados retornados
            guard let dados = snapShot.value as? NSDictionary else {return}
            
            // Recupera os dados do snapshot
            guard let userEmail = dados["email"] as? String else {return}
            guard let userName = dados["nome"] as? String else {return}
            let userId = snapShot.key
            
            // Cria instancia de usuario
            let usuario = Usuario(email: userEmail, nome: userName, uid: userId)
            
            // Adiciona usuário criado no array
            self.usuarios.append(usuario)
            self.contentView.usersListTableView.reloadData()
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
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = usuarios[indexPath.row].nome
        cell.detailTextLabel?.text = usuarios[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let user = self.usuarios[indexPath.row]
        let userId = user.uid
        
        // Recupera as referencias do banco de dados
        let database = Database.database().reference()
        let usuarios = database.child("usuarios")
        
        // Cria um objeto de snap
        let snap: [Snap] = []
        
        // Cria ou acesso nó de snaps no firebase e cria o identificador unico de cada snap com a ferramenta do firebase o childbyautoid e passa um snap para o nó de snaps
        let snaps = usuarios.child(userId).child("snaps")
        snaps.childByAutoId().setValue(snap)
    }
    
    
}
