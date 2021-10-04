//
//  ViewController.swift
//  RestaurantsApp
//
//  Created by rime.brika on 9/16/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController{
    var searchView = SearchView()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchView.contentView)
        searchView.setUpAutoLayout()
        searchView.submitButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
    }
    @objc func buttonClicked(sender: UIButton!){
        print("Button Clicked")
        if searchView.zipCode.text?.isEmpty == true {
            print("no zipcode entered")
            var popUpWindow: PopUpWindow!
            popUpWindow = PopUpWindow(title: "Error", text: "Sorry, There was no ZipCode Entered!", buttontext: "OK")
            self.present(popUpWindow, animated: true, completion: nil)
        }
        else {
            print("ZipCode entered")
            let rootVC = SecondViewController()
            rootVC.zipCode = ((searchView.zipCode.text)! as NSString).integerValue
            print(rootVC.zipCode!)
            DispatchQueue.main.async {
                RestaurantService.getRestaurants(zipCode: rootVC.zipCode).subscribe(onNext: {
                rootVC.array = $0
                print(rootVC.array.count)
                rootVC.myView.resturantListView.reloadData();
                
            }).disposed(by: self.disposeBag)
            }
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
            
        }
        
    }
    
}

class SecondViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{
    var  array = [Restaurant]()
    let disposeBag = DisposeBag()
    var myView = ResturantListView()
    let vc1 = ViewController()
    var zipCode : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurants in your zipcode"
        view.addSubview(myView.contentView)
         myView.setUpAutoLayout()
         myView.resturantListView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: "cell")
         myView.resturantListView.delegate = self
         myView.resturantListView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(array.count)
        return array.count
        
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myView.resturantListView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! RestaurantTableViewCell
        let restaurant = array[indexPath.item]
        print(restaurant.name!)
        cell.textLabel?.text =  restaurant.name
        cell.textLabel?.text! += " - "
        cell.textLabel?.text! += (restaurant.cuisine!).capitalized
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailedViewController()
        vc.title = array[indexPath.item].name
        DispatchQueue.main.async {
            RestaurantService.getRestaurantInfo(id: self.array[indexPath.item].id!).subscribe(onNext: {
                vc.reviews = $0
                print(vc.reviews.count)
                vc.fillInReviews()
            
        }).disposed(by: self.disposeBag)
        }
        navigationController?.pushViewController(vc  , animated: true)
        
    }
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
}

class DetailedViewController: UIViewController{
    var detailedView = DetailedView()
    var reviews = [Review]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        view.addSubview(detailedView.contentView)
        detailedView.setUpAutoLayout()
        
    }
    func fillInReviews(){
        detailedView.detailed1TextView.text = ("\(reviews[0].name!)\n \(reviews[0].rating!) \n \(reviews[0].text!)")
        detailedView.detailed2TextView.text = ("\(reviews[1].name!)\n \(reviews[1].rating!) \n \(reviews[1].text!)")
        detailedView.detailed3TextView.text = ("\(reviews[2].name!)\n \(reviews[2].rating!) \n \(reviews[2].text!)")
        
    }
}

