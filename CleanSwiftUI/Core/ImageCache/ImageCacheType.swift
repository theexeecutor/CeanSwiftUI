//
//  ImageCacheType.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import Foundation
import UIKit.UIImage

protocol ImageCacheType {
    func image(for url: String) -> UIImage?
    func saveImage(_ image: UIImage, for url: String)
}
