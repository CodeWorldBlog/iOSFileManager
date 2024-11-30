//
//  MFeedContentViewModel.swift
//  FileManager
//
//  Created by Saurav Nagpal on 27/04/23.
//

import Foundation
import Combine

class FMFinderContentViewModel: FMViewModel {
    // MARK: - iVar.
    let dependencies: FMFinderDependencies
    fileprivate var currentFeedPageIndex = 0
    let feedPageSize = 50
    fileprivate var store = Set<AnyCancellable>()
    fileprivate(set) var categories: FMFinderCategoryListCellModel?
    fileprivate(set) var folders: FMFinderFolderListCellModel?
    fileprivate(set) var recentFiles: [FMFinderRecentFileCellModel]?
    fileprivate var foldersModel: [FMDocument]?
    let fetchDocumentUseCase: FMAllFolderUseCase
    let fetchCatgeoryUseCase: FMAllCategoryUseCase
    let fetchRecentFileUseCase: FMRecentFileUseCase
    
    //MARK: - Life Cycle
    init(dependencies: FMFinderDependencies)  {
        self.dependencies = dependencies
        self.fetchDocumentUseCase = dependencies.resolveFetchDocumentUseCase()
        self.fetchCatgeoryUseCase = dependencies.resolveFetchCategoryUseCase()
        self.fetchRecentFileUseCase = dependencies.resolveRecentDependenciesUseCase()
        self.addThemeObserver()
        self.fetchAllDocument()
    }
    
    func apply(theme: FMTheme) {
        
    }

}

//MARK:- Document Fetch
fileprivate extension FMFinderContentViewModel {
    func fetchAllDocument()  {
        Task {
            let categories = await fetchCatgeoryUseCase.fetchAllCategory()
            setupCategories(categories)
            
            let documents = await fetchDocumentUseCase.fetchAllDocument()
            setupFinderDocument(documents: documents)
            
            //Recent File
            let files = await fetchRecentFileUseCase.fetchAllRecentFiles()
            
        }
    }
    
    func setupFinderDocument(documents: [FMDocument]) {
        var documentList: [FMFinderDocument] = []
        for document in documents {
            let finderDocument = FMFinderDocument(document: document)
            documentList.append(finderDocument)
        }
        self.foldersModel = documents
        self.folders = FMFinderFolderListCellModel(header: "Folders", folders: documentList, documentTapped: self.displayDocument)
    }
    
    func setupCategories(_ categories: [FMCategory]) {
        var finderCategories: [FMFinderCategory] = []
        for category in categories {
            let finderDocument = FMFinderCategory(category: category)
            finderCategories.append(finderDocument)
        }
        self.categories = FMFinderCategoryListCellModel(header: "Categories", categories: finderCategories)
    }
    
    func setupRecnetFiles(_ files: [FMFile]) {
        var fileCellModels: [FMFinderRecentFileCellModel] = []
        for file in files {
            fileCellModels.append(FMFinderRecentFileCellModel(document: file))
        }
        self.recentFiles = fileCellModels
    }
    
    func displayDocument(_ document: FMFinderDocument) {
        guard let foldersModel  = foldersModel else { return }
        for folder in foldersModel {
            if folder.name == document.title {
                self.dependencies.coordActions.displayDocument(folder)
            }
        }
    }
}
