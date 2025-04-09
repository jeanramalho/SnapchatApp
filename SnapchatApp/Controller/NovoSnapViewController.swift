//
//  NovoSnapViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 03/04/25.
//
import Foundation
import UIKit
import PhotosUI
import FirebaseStorage

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
    
    var randomImgId = UUID().uuidString
    
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
        
        let proximoButton = contentView.proximoButton
        
        proximoButton.isEnabled = false
        proximoButton.backgroundColor = .lightGray
        
        proximoButton.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
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
    
    // Função auxiliar que mostra um alerta de erro no upload
    private func showUploadError() {
        let alerta = CustomAlert(
            titulo: "Upload de snap falhou!",
            mensagem: "Erro ao realizar upload de snap, por favor tente novamente!"
        )
        self.present(alerta.getAlerta(), animated: true, completion: nil)
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
    
    @objc private func nextStep(){
            
        let proximoButton = contentView.proximoButton
        let snapImageView = contentView.snapImageView
        
        // Desativa o botão e mostra carregando enquanto o processo é realizado
        proximoButton.isEnabled = false
        proximoButton.setTitle("Carregando...", for: .normal)
        
        // Garante que existe uma imagem selecionada e converte para jpg com a compressão desejada
        guard let selectedImage = snapImageView.image,
              let dataImage = selectedImage.jpegData(compressionQuality: 0.5) else {
            // Gera alerta de erro
            showUploadError()
            return
        }
        
        // Cria referencia base para Firebase Storage
        let storage = Storage.storage().reference()
        // Cria ou acessa a pasta imagens no storage
        let imageFolder = storage.child("imagens")
        // Gera um ID unico para a imagem
        let randomImageId = UUID().uuidString
        // Cria referencia do arquivo completo: imagens/NomeGeradoDaImagem.jpg
        let imageRef = imageFolder.child("\(randomImageId).jpg")
        
        // Envia a imagem para o firebase storage
        imageRef.putData(dataImage, metadata: nil) { _, uploadError in
            
            // Se der erro no upload exibe alerta
            if let uploadError = uploadError {
                
                print("Erro ao realizar upload da imagem: \(uploadError.localizedDescription)")
                self.showUploadError()
                return
            }
            
            // Depois do upload tenta obter a url publica de download da imagem
            imageRef.downloadURL { url, downloadError in
                
                // Se falhar, exibe o alerta
                if let downloadError = downloadError {
                    print("Erro ao obter url de download da imagem: \(downloadError.localizedDescription)")
                    self.showUploadError()
                    return
                }
                
                // Se a url for nula, exibe o erro
                guard let imageURL = url else {
                    print("A URL é nula!")
                    self.showUploadError()
                    return
                }
                
                // Se tudo der certo printa a url e vai para proxima tela salvando a url na variavel da proxima tela
                print("Imagem enviada com sucesso: \(imageURL)")
                
                // Cria a proxima tela e envia a url para lá
                let usersListViewController = UsersListViewController()
                usersListViewController.imageURL = imageURL
                usersListViewController.descritionSnap = self.contentView.descriptionTextFiel.text
                
                // Navega pra proxima tela
                self.navigationController?.pushViewController(usersListViewController, animated: true)
                
                // Reativa o botão e restaura o título
                proximoButton.isEnabled = true
                proximoButton.setTitle("Proximo", for: .normal)
                
                
            }
        }          
 
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
                    // ativa o botao proximo
                    self.contentView.proximoButton.isEnabled = true
                    self.contentView.proximoButton.backgroundColor = .systemBlue
                }
            }
        }
    }
    
    
}
