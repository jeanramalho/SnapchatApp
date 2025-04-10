//
//  HomeViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    let contentView: HomeView = HomeView()
    
    var snaps: [Snap] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getSnaps()
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
                    action: #selector(logoutSnapchat)
                )
                
                navigationItem.rightBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "plus"),
                    style: .plain,
                    target: self,
                    action: #selector(showNovoSnapView)
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
    
    private func getSnaps(){
        
        let auth = Auth.auth()
        
        if let loggedUserId = auth.currentUser?.uid {
            
            // Recupero Banco de dados
            let database = Database.database().reference()
            // Acessa no de usuários
            let usuarios = database.child("usuarios")
            // Acessa o mó de snaps do usuário logado
            let snaps = usuarios.child(loggedUserId).child("snaps")
            
            snaps.observe(DataEventType.childAdded) { snapShot in
                
                guard let dados = snapShot.value as? [String: Any] else { return }
                guard let nomeRemetente = dados["remetenteNome"] as? String else {return}
                guard let remetente = dados["remetente"] as? String else {return}
                guard let descricao = dados["descricao"] as? String else {return}
                guard let imageUrl = dados["imageUrl"] as? String else {return}
                guard let imageId = dados["imageId"] as? String else {return}
                
                
                let snap = Snap(identifier: snapShot.key,
                                remetente: remetente,
                                remetenteNome: nomeRemetente,
                                descricao: descricao,
                                imageUrl: imageUrl,
                                imageId: imageId)
                
                self.snaps.append(snap)
                self.contentView.snapsTableView.reloadData()
                
            }
        }
    }
    
    private func showSnapModal(snap: Snap){
        
        let modalViewController = SnapViewController()
        modalViewController.modalPresentationStyle = .fullScreen
        modalViewController.snap = snap
        present(modalViewController, animated: true)
    }
    
    @objc private func showNovoSnapView(){
        
        let novoSnapView = NovoSnapViewController()
        
        self.navigationController?.pushViewController(novoSnapView, animated: true)
    }
    
    @objc private func logoutSnapchat(){
        
        let auth = Auth.auth()
        let loginViewController = SnapchatLoginViewController()
        
        do {
            try auth.signOut()
            self.navigationController?.setViewControllers([loginViewController], animated: true)
        } catch {
            print("Erro realizar logout: \(error.localizedDescription)")
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if snaps.count > 0 {
            return snaps.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if snaps.count > 0 {
            cell.textLabel?.text = snaps[indexPath.row].remetenteNome
        } else {
            cell.textLabel?.text = "Nenhum Snap novo para você :)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if snaps.count > 0 {
            let snap = self.snaps[indexPath.row]
            self.showSnapModal(snap: snap)
        }
    }
    
    
}
