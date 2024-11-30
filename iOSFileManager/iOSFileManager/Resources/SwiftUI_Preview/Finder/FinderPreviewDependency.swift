//
//  FeedDependency.swift
//  FileManager
//
//  Created by Saurav Nagpal on 07/05/23.
//

import Foundation

class FinderPreviewDependency {
    let previewDepdendency = AppPreviewDependency()
    let appNavigationState = FMAppNavigationState()
    
    func finderContentViewModel() -> FMFinderContentViewModel {
        return self.finderDependencies().resolveFinderContentViewModel()
    }
    
    func finderDependencies() -> FMFinderDependencies {
        let actions = FMFinderCoordinatorAction(displayDocument: self.displayDocument)
        return DefaultFMFinderDependencies(dependencies: previewDepdendency, coordActions: actions)
    }
    
    func finderCoordinater() -> FMFinderCoordinator{
        return FMFinderCoordinator(dependencies: self.previewDepdendency, appNavigationState: self.appNavigationState)
    }
    
    func resolveFetchDocumentUseCase() -> FMAllFolderUseCase {
        return DefaultFMFolderDocumentUseCase(dependencies: previewDepdendency)
    }
    
    
    func folderListCellModel() async -> FMFinderFolderListCellModel? {
        let documents = await self.resolveFetchDocumentUseCase().fetchAllDocument()
        let folders = documents.map { document in
            FMFinderDocument(document: document)
        }
        return FMFinderFolderListCellModel(header: "Folders", folders: folders, documentTapped: displayDocumentDetail)
    }
    
    func displayDocument(_ document: FMDocument) {
        
    }
    
    func displayDocumentDetail(_ documentModel: FMFinderDocument) {
        Task {
            let documents = await self.resolveFetchDocumentUseCase().fetchAllDocument()
            documents.forEach { document in
                if document.name == documentModel.title {
                    self.displayDocument(document)
                }
            }
        }
    }
}
