//
//  ContentView.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            MovieSearchView()
                
        } detail: {
            MovieDetailView()
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
