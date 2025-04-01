//
//  SnapchatLoginViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 31/03/25.
//
import Foundation
import UIKit

class SnapchatLoginViewController: UIViewController {
    
    private let contentView: SnapchatLoginView = SnapchatLoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupContentView(){
        
        let entrarButton = contentView.entrarButton
        let cadastrarButton = contentView.cadastrarButton
        
        entrarButton.addTarget(self, action: #selector(showEntrarView), for: .touchUpInside)
        cadastrarButton.addTarget(self, action: #selector(showCadastrarView), for: .touchUpInside)
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
    
    @objc private func showCadastrarView(){
        
        print("clicado")
        
        let cadastrarViewController = CadastrarViewController()
        
        self.navigationController?.pushViewController(cadastrarViewController, animated: true)
    }
    
    @objc private func showEntrarView(){
        
        let entrarViewController = EntrarViewController()
        
        self.navigationController?.pushViewController(entrarViewController, animated: true)
    }
}
