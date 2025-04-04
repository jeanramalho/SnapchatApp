//
//  NovoSnapViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 03/04/25.
//
import Foundation
import UIKit
import PhotosUI

class NovoSnapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let contentView: NovoSnapView = NovoSnapView()
    
    // Instancia variavel que controla selecao de imagens ou tirar foto
    // Método antigo
//    lazy var imagePicker: UIImagePickerController = {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        return imagePicker
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupNavigationBar()
        setupContenView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupNavigationBar(){
        
        self.title = "Crie seu Snap"
            
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
                
                
                navigationItem.rightBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "camera"),
                    style: .plain,
                    target: self,
                    action: #selector(criarSnap)
                )
            }
            
        }
    
    private func setupContenView(){
        
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
    
    @objc private func criarSnap(){
        // Metodo ultrapassado
//        present(imagePicker, animated: true, completion: nil)
        
        //MARK: Novo método para abrir a galeria
        var config = PHPickerConfiguration()
        config.selectionLimit = 1 // Configura a quantidade de imagens a serem selecionadas
        config.filter = .images // Pode usar .videos ou .any para os dois tipos
        
        let picker = PHPickerViewController(configuration: config) // instancia o imagePicker
        picker.delegate = self
        
        present(picker, animated: true)
        
    }
}

extension NovoSnapViewController: PHPickerViewControllerDelegate {
    
    // metodo delegate chamado quando a usuário finaliza a selecao da foto
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        // fecha o seletor de fotos apos a selecao
        picker.dismiss(animated: true)
        
        // Verifica se existe uma selecao e pega a imagem selecionada
        guard let selectedImg = results.first?.itemProvider,
              selectedImg.canLoadObject(ofClass: UIImage.self) else {return}
        
        // Carrega o objeto como UIImage de forma assincrona
        selectedImg.loadObject(ofClass: UIImage.self) { image, error in
            
            // Verifica se o objeto selecionado é uma imagem válida
            if let imgSelected = image  as? UIImage {
                
                // Como vamos atualizar a interface isso deve ser feita de forma assincrona
                DispatchQueue.main.async {
                    
                    // Utiliza a imagem
                    self.contentView.snapImageView.image = imgSelected
                }
            }
        }
    }
    
    
}
