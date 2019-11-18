//
//  UIImageView+Extension.swift
//  WorkShopDemo
//
//  Created by Gurung Bishow on 17/11/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import Foundation
import UIKit
var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func setImage(fromUrl url: URL) {
        if let cacheImage = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = cacheImage
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Couldn't download image: ", error)
                return
            }
            guard let data = data, let image = UIImage(data: data) else { return }
            imageCache.setObject(image, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()

    }
}
