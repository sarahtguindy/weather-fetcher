//
//  LaunchFetcher.swift
//  WeatherInfo
//
//  Created by Sarah Guindy on 2021-04-08.
//

import Foundation
class LaunchesFetcher : ObservableObject{
    var apiURL = "https://www.weatherapi.com/"
    
    @Published var launchList = [Launch]()
    
    //singleton instance
    private static var shared : LaunchesFetcher?
    
    static func getInstance() -> LaunchesFetcher{
        if shared != nil{
            //instance already exists
            return shared!
        }else{
            // create a new singlton instance
            return LaunchesFetcher()
        }
    }
    
    func fetchDataFromAPI(){
    }
}
