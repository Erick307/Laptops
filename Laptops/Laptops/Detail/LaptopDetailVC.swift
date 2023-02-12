//
//  LaptopDetailVC.swift
//  Laptops
//
//  Created by Erick Silva on 11/02/2023.
//

import UIKit

class LaptopDetailVC: UIViewController {
    
    let presenter = LaptopDetailPresenter()
    var laptop : Laptop? = nil
    
    let image : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    let lblTitle : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 22)
        l.textColor = UIColor.white
        l.numberOfLines = 0
        l.clipsToBounds = true
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let lblDescription : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let shadowView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    static func getViewController(laptop:Laptop) -> UIViewController{
        let vc = LaptopDetailVC()
        vc.laptop = laptop
        return vc
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.bind(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.unbind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(image)
        scrollView.addSubview(shadowView)
        scrollView.addSubview(lblTitle)
        scrollView.addSubview(lblDescription)
        
        
        lblTitle.text = laptop?.title
        lblDescription.text = laptop?.description
        image.loadThumbnail(urlString:laptop?.image ?? "")
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        lblTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lblTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -10).isActive = true
        lblTitle.sizeToFit()

        shadowView.topAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        shadowView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        shadowView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        image.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        image.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        
        lblDescription.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        lblDescription.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lblDescription.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -10).isActive = true
        lblDescription.sizeToFit()

        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.frame.size = CGSize(width: view.frame.width, height: view.frame.width/2)
        gradient.colors = [UIColor(white: 0, alpha: 0).cgColor,UIColor(white: 0, alpha: 1).cgColor]
        shadowView.layer.addSublayer(gradient)
    }
    
}

extension LaptopDetailVC : LaptopDetailView {
    
}
