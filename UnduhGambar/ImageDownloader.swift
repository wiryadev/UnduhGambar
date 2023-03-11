//
//  ImageDownloader.swift
//  UnduhGambar
//
//  Created by Abrar Wiryawan on 03/03/23.
//

import Foundation
import UIKit

class ImageDownloader: Operation {
    
    func downloadImage(url: URL) async throws -> UIImage {
        async let imageData: Data = try Data(contentsOf: url)
        return UIImage(data: try await imageData)!
    }
    
}
