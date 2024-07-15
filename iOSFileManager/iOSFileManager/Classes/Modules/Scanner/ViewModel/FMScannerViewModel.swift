//
//  AddFeedViewModel.swift
//  FileManager
//
//  Created by Saurav Nagpal on 22/05/23.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI

class FMScannerViewModel: FMViewModel {
    let addFeedDependencies: FMScannerDependencies
    fileprivate var currentFeedPageIndex = 0
    let feedPageSize = 50
    fileprivate var store = Set<AnyCancellable>()
    @Published var selectedPickerItem: PhotosPickerItem? {
        didSet {
            if let selectedPickerItem {
                loadTransferable(from: selectedPickerItem)
            }
        }
    }
    @Published var selectedImage: Image?
    @Published var postText = ""
    
    var canPostContent: Bool {
        return (self.postText.count > 0 || self.selectedImage != nil)
    }
    
    //MARK: - Life Cycle
    init(scannerDependencies: FMScannerDependencies) {
        self.addFeedDependencies = scannerDependencies
        self.addThemeObserver()
    }
    
    func apply(theme: FMTheme) {
        
    }
}

//MARK: - Media Handling
fileprivate extension FMScannerViewModel {
    enum TransferError: Error {
        case importFailed
    }
    
    struct ProfileImage: Transferable {
        let image: Image
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
                guard let uiImage = UIImage(data: data) else {
                    print("Failed Image converison.")
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                return ProfileImage(image: image)
            }
        }
    }
    
    @discardableResult private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: ProfileImage.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.selectedPickerItem else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let profileImage?):
                    self.selectedImage = profileImage.image
                case .success(nil):
                   print("No Image selected")
                case .failure(let error):
                    print("Image selection fail \(error.localizedDescription)")
                }
            }
        }
    }
}
