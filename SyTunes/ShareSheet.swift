//
//  ShareSheet.swift
//  SyTunes
//
//  Created by Ayden Deng on 3/18/24.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    var itemsToShare: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

