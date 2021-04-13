//
//  LaunchFetcher.swift
//  WeatherInfo
//
//  Created by Sarah Guindy on 2021-04-08.
//

import Foundation
class WeatherFetcher : ObservableObject{
    var apiURL = "https://api.weatherapi.com/v1/current.json?key=744277c55e4847b1bf104511211204&q="
    
    @Published var weatherItem = Weather()
    private static var shared : WeatherFetcher?
    
    static func getInstance() -> WeatherFetcher{
        if shared != nil{
            return shared!
        }else{
            return WeatherFetcher()
        }
    }
    
    func fetchDataFromAPI(city: String) {
        let fullAPI = apiURL + city + "&aqi=no"
        
        guard let api = URL(string: fullAPI) else {
            return
        }
        
        URLSession.shared.dataTask(with: api) { (data: Data?, response: URLResponse?, error: Error?) in
            if let err = error {
                print(#function, "Error: ", err)
            } else {
                DispatchQueue.global().async {
                    do {
                        if let jsonData = data {
                            let decoder = JSONDecoder()
                            let decodedObj = try decoder.decode(Weather.self, from: jsonData)
        
                            DispatchQueue.main.async {
                                self.weatherItem = decodedObj
                            }
                        }
                    }
                    catch let error {
                        print(#function, "Error: ", error)
                    }
                }
            }
        }.resume()
    }
}
