//
//  LaptopCell.swift
//  Laptops
//
//  Created by Erick Silva on 11/02/2023.
//

import UIKit

class LaptopCell : UITableViewCell {
    
    let image : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    let lblTitle : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 16)
        l.numberOfLines = 0
        l.clipsToBounds = true
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let lblDescription : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12)
        l.numberOfLines = 2
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    func setLaptop(laptop:Laptop){
        lblTitle.text = laptop.title
        lblTitle.sizeToFit()
        lblDescription.text = laptop.description
        lblDescription.sizeToFit()
        image.loadThumbnail(urlString: laptop.image)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        contentView.addSubview(image)
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)
        
        lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        lblDescription.topAnchor.constraint(greaterThanOrEqualTo: lblTitle.bottomAnchor, constant: 5).isActive = true
        lblDescription.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
