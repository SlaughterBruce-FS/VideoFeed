//
//  ContentView.swift
//  VideoFeed
//
//  Created by J C on 5/30/23.
//

import SwiftUI
import PhotosUI
import AVKit

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.videos) { video in
                    VideoPlayer(player: AVPlayer(url: URL(string: video.videoUrl)!))
                        .frame(height: 250)
                }
            }
            .refreshable {
                Task { try await viewModel.fetchVideos() }
            }
                .navigationTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    PhotosPicker(selection: $viewModel.selectedItem, matching: .all(of: [.videos, .not(.images)]))
                               {
                      Image(systemName: "plus")
                               }.foregroundColor(.black)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
