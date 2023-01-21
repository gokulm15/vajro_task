//
//  HomePageViewModel.swift
//  Task
//
//  Created by Apple on 21/01/2023.
//

import Foundation
class HomePageViewModel{
    let api = HomePageApi()
    var homeRes: HomePageModelClass?
    func getList(success: @escaping() -> (), onError: @escaping(String) -> ()) {
        api.getList { res in
            self.homeRes = res
            
            success()
            
        } onError: { error in
            print("apiresponseError",error)
            onError(error)
        }

    }
    
}
