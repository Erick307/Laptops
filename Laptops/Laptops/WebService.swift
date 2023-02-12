//
//  WebService.swift
//  Laptops
//
//  Created by Erick Silva on 11/02/2023.
//

import Foundation

class WebService {
    
    
    static let shared = WebService()
    
    private init() {
    }
    
    public typealias Response<T> = (T)-> Void
    public typealias ErrorResponse = (String) -> Void
    
    let baseUrl = "https://private-f0eea-mobilegllatam.apiary-mock.com"
    
    var laptops : [Laptop] = []
    
    func fetchLaptops(onError: @escaping ErrorResponse,
                      onResponse:@escaping Response<[Laptop]>){
        guard let url = URL(string:baseUrl+"/list") else{
            // "Not a url"
            return
        }
        let request = URLSession.shared.dataTask(with: url) { [weak self] data, response, e in
            if let _ = e {
                DispatchQueue.main.async {
                    onError(e?.localizedDescription ?? "Known error")
                }
            }
            
            guard let data = data else{
                DispatchQueue.main.async {
                    onError("No data")
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let laptops = try decoder.decode([Laptop].self, from: data)
                DispatchQueue.main.async {
                    self?.laptops = laptops
                    onResponse(laptops)
                }
            }catch{
                DispatchQueue.main.async {
                    onError("Parse error")

                }
            }
        }
        request.resume()
    }
    
}
