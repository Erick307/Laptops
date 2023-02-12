//
//  LaptopDetailPresenter.swift
//  Laptops
//
//  Created by Erick Silva on 11/02/2023.
//

import Foundation

class LaptopDetailPresenter {
    
    var view : LaptopDetailView?
    
    func bind(_ v:LaptopDetailView){
        view = v
    }
    
    func unbind(){
        view = nil
    }
    
    
    
}

protocol LaptopDetailView {
    
}
