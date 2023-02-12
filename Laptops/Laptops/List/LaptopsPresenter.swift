//
//  LaptopsPresenter.swift
//  Laptops
//
//  Created by Erick Silva on 11/02/2023.
//

import Foundation

class LaptopsPresenter {
    
    var view : LaptopsView?
    var laptops : [Laptop] = []
    
    func bind(_ v:LaptopsView){
        view = v
    }
    
    func unbind(){
        view = nil
    }
    
    func updateLaptops(){
        WebService.shared.fetchLaptops { error in
            print(error)
        } onResponse: { [weak self] laptops in
            self?.laptops = laptops
            self?.view?.refresh()
        }

    }
}

protocol LaptopsView {
    func refresh()
}
