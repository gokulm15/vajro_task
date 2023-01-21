//
//  HomePageAPI.swift
//  Task
//
//  Created by Apple on 21/01/2023.
//

import Foundation
struct HomePageApi {
    struct Url {
        let pageUrl = "https://run.mocky.io/v3/cdc1c53e-2825-4162-826d-b8294e477934"
    }
    let urlKey = Url()
    var networkLayer = NetworkLayer()
    func getList(success: @escaping(HomePageModelClass) -> (), onError: @escaping(String) -> ()) {
        networkLayer.postRequest(url: urlKey.pageUrl, success: success, onError: onError)
    }
}
