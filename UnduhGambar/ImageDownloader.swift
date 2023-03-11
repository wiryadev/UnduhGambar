//
//  ImageDownloader.swift
//  UnduhGambar
//
//  Created by Abrar Wiryawan on 03/03/23.
//

import Foundation
import UIKit

class ImageDownloader: Operation {
    
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    override func main() {
        if isCancelled { return }
        
        guard let imageData = try? Data(contentsOf: self.movie.poster) else { return }
        
        if isCancelled { return }
        
        if !imageData.isEmpty {
            self.movie.image = UIImage(data: imageData)
            self.movie.state = .downloaded
        } else {
            self.movie.image = nil
            self.movie.state = .failed
        }
    }
    
}

class PendingOperations {
    lazy var downloadInProgress: [IndexPath: Operation] = [:]
    
    lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.wiryadev.imagedownload"
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
}
