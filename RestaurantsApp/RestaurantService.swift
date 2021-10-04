//
//  RestaurantService.swift
//  RestaurantsApp
//
//  Created by rime.brika on 9/16/21.
//

import Foundation
import UIKit
import RxSwift

class RestaurantService {
    static func getRestaurants(zipCode: Int) -> Observable<[Restaurant]>{
        let apikey = "q9jAkSwx6qRQOky1nGDUsNb2R8v0xzOdg2wN7XWdSfhz7sAnpHXk9EwO0B25WdgH339zjWtiz3znPIhOiJkIA8dfsgM2_St2tG-CndjwtmJHzb5ciw6NJZNvDRlOYXYx"
        return Observable.create { observer -> Disposable in
        let url = URL(string: "https://api.yelp.com/v3/businesses/search?limit=50&offset0&location=\(zipCode)")
            var request = URLRequest(url: url!)
            request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            var restaurants =  [Restaurant]()
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let err = error {
                        print(err.localizedDescription)
                    }
                do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                    DispatchQueue.main.async {
                        guard let resp = json as? NSDictionary else {return}
                    guard let biz = resp.value(forKey: "businesses") as? [NSDictionary] else {return}
                   
                    for a in biz{
                        var r = Restaurant()
                        r.id = (a.value(forKey: "id") as? String)
                        r.name = (a.value(forKey: "name") as! String)
                        r.cuisine = (a.value(forKeyPath: "categories.title") as! Array<String>).first
                        restaurants.append(r)
                        print(r)
                    }
                       
                        observer.onNext(restaurants)
                        
                    }
                } catch {
                        print("caught")
                    }
            }.resume()
            return Disposables.create { }
            
        }
    }
    static func getRestaurantInfo(id: String)-> Observable<[Review]>{
        let apikey = "q9jAkSwx6qRQOky1nGDUsNb2R8v0xzOdg2wN7XWdSfhz7sAnpHXk9EwO0B25WdgH339zjWtiz3znPIhOiJkIA8dfsgM2_St2tG-CndjwtmJHzb5ciw6NJZNvDRlOYXYx"
        
        return Observable.create { observer -> Disposable in
            let url = URL(string: "https://api.yelp.com/v3/businesses/\(id)/reviews")
            var request = URLRequest(url: url!)
            request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let err = error {
                    print(err.localizedDescription)
                }
            do {
                var reviews: [Review] = []
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                DispatchQueue.main.async {
                    guard let resp = json as? NSDictionary else {return}
                   
                    guard let biz = resp.value(forKey: "reviews") as? [NSDictionary] else {return}
                    
                    for a in biz{
                        var r = Review()
                        r.rating = a.value(forKey: "rating") as! Float
                        r.text = (a.value(forKey: "text") as! String)
                        r.name = (a.value(forKeyPath: "user.name") as! String)
                        reviews.append(r)
                      
                      
                    }
                       
                    observer.onNext(reviews)
                    }
            } catch {
                    print("caught")
                }
        }.resume()
       
            return Disposables.create { }
            
        }
    
}

}
