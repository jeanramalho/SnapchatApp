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
}
