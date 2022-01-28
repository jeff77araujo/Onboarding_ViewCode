//
//  GalleryView.swift
//  Onboarding
//
//  Created by Jefferson Oliveira de Araujo on 26/01/22.
//

import UIKit

final class GalleryView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure() {
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
    }
    
    public func configureData(_ data: [UIView]) {
        data.forEach { view in
            contentStackView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalTo: widthAnchor)
            ])
        }
    }
    
    public func configureData(_ data: [String]) {
        data.forEach { imageString in
            let imageView = buildImageView(imageString)
            contentStackView.addArrangedSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalTo: contentStackView.heightAnchor)
            ])
        }
    }
    
    private func buildImageView(_ url: String) -> UIImageView {
        let image = UIImageView()
        image.downloaded(from: url)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
}
