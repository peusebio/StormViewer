//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Pedro Eusébio on 11/05/2019.
//  Copyright © 2019 Pedro Eusébio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageViewConstraints: [NSLayoutConstraint] = []
    
    var selectedImage: String?
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = UIImageView.ContentMode.scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(imageView)
        activateConstraints()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            navigationItem.title = imageToLoad
        }
    }
    
    func activateConstraints() {
        
        //this value can be used as a constant on the topAnchor so the image top is always placed immediately below the navbar when the imageView's content mode is scaleAspectFill
        //let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            //(self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        imageViewConstraints = [imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                imageView.topAnchor.constraint(equalTo: view.topAnchor),
                                imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)]
        
        NSLayoutConstraint.activate(imageViewConstraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
