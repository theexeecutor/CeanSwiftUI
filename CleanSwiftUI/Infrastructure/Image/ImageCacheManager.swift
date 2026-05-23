//
//  ImageCacheManager.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation
import UIKit.UIImage


class ImageCacheManager: ImageCacheType {
    private var cache: NSCache<NSString, UIImage> = NSCache()
    
    func image(for url: String) -> UIImage? {
        return nil
    }
    
    func saveImage(_ image: UIImage, for url: String) {
        
    }
}
