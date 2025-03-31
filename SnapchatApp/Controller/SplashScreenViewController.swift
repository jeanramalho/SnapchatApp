//
//  SplashScreenViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 31/03/25.
//
import Foundation
import UIKit

class SplashScreenViewController: UIViewController {
    
    private let contentView: SplashScreenView = SplashScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        showLoginView()
        setHierarchy()
        setConstraints()
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
    
    private func showLoginView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let loginViewController = SnapchatLoginViewController()
            self.navigationController?.setViewControllers([loginViewController], animated: true)
        }
    }
}
