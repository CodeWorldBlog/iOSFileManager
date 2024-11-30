//
//  FMAllDocumentUseCase.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation
import Combine

protocol FMAllCategoryUseCase {
    func fetchAllCategory() async -> [FMCategory]
}

class DefaultFMAllCategoryUseCase: FMAllCategoryUseCase {
    fileprivate var repository: FMDocumentRepository
   
    init(dependencies: FMDocumentDependencies) {
        self.repository = dependencies.resolveDocumentRepository()
    }
    
    func fetchAllCategory() async -> [FMCategory] {
        var categories: [FMCategory] = []
        var categoryDTOs =  await self.repository.fecthAllCategories()
        if categoryDTOs.isEmpty {
            categoryDTOs = self.defaultFMCatgeories()
        }
        
        for categoryDTO in categoryDTOs {
           let category = FMCategory(dto: categoryDTO)
            categories.append(category)
        }
        return categories
    }
}

fileprivate extension DefaultFMAllCategoryUseCase {
    func defaultFMCatgeories() -> [CategoryDTO] {
        let emptyDocumentSize: Double = 0
        var defaultCategories: [CategoryDTO] = []
        for category in FMDefaultCategory.allCases {
            let document = CategoryDTO(name: category.name, icon: category.icon)
            defaultCategories.append(document)
        }
        return defaultCategories
    }
}
