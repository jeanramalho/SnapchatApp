//
//  SnapViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 10/04/25.
//
import Foundation
import UIKit

class SnapViewController: UIViewController {
    
    private let contentView: SnapView = SnapView()
    
    var snap: Snap?
    
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
        
        
        contentView.legendLabel.text = snap?.descricao
        
        //Baixa a imagem e a exibe na view e starta o contador
        if let urlImageString = snap?.imageUrl, let url = URL(string: urlImageString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {return}
                DispatchQueue.main.async {
                    self.contentView.snapImageView.image = UIImage(data: data)
                    self.contentView.circleCounter.startCountdown(duration: 15)
                    
                    // Fecha modal após os 15 segundos de visualização da imagem
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                }
            }.resume()
        }
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
