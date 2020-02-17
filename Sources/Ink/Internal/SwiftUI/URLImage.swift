//
//  URLImage.swift
//  
//
//  Created by Will Taylor on 2/16/20.
//

import Foundation
import UIKit
import SwiftUI

internal struct URLImage: View {
    
    @ObservedObject private var viewModel = URLImageViewModel()
        
    var body: some View {
        Image(uiImage: self.viewModel.image)
    }
    
    init(imageUrl: URL?) {
        viewModel.downloadImage(fromUrl: imageUrl)
    }
}

internal class URLImageViewModel: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func downloadImage(fromUrl url: URL?) {
        guard let url = url else {
            return
        }
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.image =  UIImage(data: data) ?? UIImage()
            }
        }
    }
 
    fileprivate func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
