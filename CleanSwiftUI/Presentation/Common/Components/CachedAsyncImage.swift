//
//  CachedAsyncImage.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import SwiftUI


struct CachedAsyncImage: View {
    let url: URL
    
    // Grabs the cache manager directly from the SwiftUI Environment
    @EnvironmentObject private var cacheManager: ImageCacheManager
    
    @State private var image: UIImage? = nil
    @State private var isLoading = false
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else if isLoading {
                ProgressView()
            } else {
                Color.gray.opacity(0.3) // Placeholder
            }
        }
        .task {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        // 1. Check Cache (Instant load)
        if let cached = cacheManager.image(for: url) {
            self.image = cached
            return
        }
        
        // 2. Download if not cached
        isLoading = true
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let downloadedImage = UIImage(data: data) {
                // 3. Save to Cache
                cacheManager.insertImage(downloadedImage, for: url)
                self.image = downloadedImage
            }
        } catch {
            print("Failed to fetch image: \(error)")
        }
        isLoading = false
    }
}

#Preview {
    CachedAsyncImage(url: URL(string: "image.example.com")!)
}
