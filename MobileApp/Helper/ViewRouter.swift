//
//  ViewRouter.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 28/03/2021.
//

import Foundation

enum Page {
    case page1
    case page2
}

class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .page1
}

