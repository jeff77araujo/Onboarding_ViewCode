//
//  ViewController.swift
//  Onboarding
//
//  Created by Jefferson Oliveira de Araujo on 26/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addGalleryView()
    }

    func addGalleryView() {
        let gallery = GalleryView()
        gallery.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gallery)
        
        NSLayoutConstraint.activate([
            gallery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gallery.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gallery.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            gallery.heightAnchor.constraint(equalToConstant: 250)
            gallery.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let label1 = UILabel()
        label1.text = "JEFF"
        label1.font = .systemFont(ofSize: 30)
        label1.textColor = .black
        label1.textAlignment = .center
        
        let label2 = UILabel()
        label2.text = "ARAUJO"
        label2.font = .systemFont(ofSize: 30)
        label2.textColor = .black
        label2.textAlignment = .center
        
        gallery.configureData([
            label1,
            label2
        ])
        
        gallery.configureData([
            "https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2831&q=80",
            "https://images.unsplash.com/photo-1522252234503-e356532cafd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2050&q=80",
            "https://images.unsplash.com/photo-1503437313881-503a91226402?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2832&q=80",
        ])
    }
}

