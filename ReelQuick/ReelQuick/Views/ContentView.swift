//
//  ContentView.swift
//  ReelQuick
//
//  Created by Megan Wiemer on 5/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MovieSearchView()
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
