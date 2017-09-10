//
//  ViewController.swift
//  Round One
//
//  Created by Jack Wong on 2017/08/15.
//  Copyright © 2017年 None. All rights reserved.
//

import ChameleonFramework
import UIKit


class ViewController: UIViewController, UITabBarDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tabBarView: UITabBar!
    
   
    @IBOutlet weak var tabBarView2: UITabBar!
        
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch  item.tag {
        case 0:
            performSegue(withIdentifier: "second", sender: self)
        case 1:
            let url = URL(string: "https://www.round1.co.jp")
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        case 2:
            let url = URL(string: "https://www.google.com")
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        case 3:
            break
        case 4:
            if tabBarView2.isHidden == true {
                tabBarView2.isHidden = false
            }else {
                tabBarView2.isHidden = true
            }
        default:
            break
        }
        /*
        if item.tag == 0 {
            performSegue(withIdentifier: "second", sender: self)
         
        let url = URL(string: "https://www.round1.co.jp")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
 
        }else {
            return
        }
 */
    }
    
    
  
    var pictures = ["megapack","cashback","bus","challengebo","cashback","bus","megapack","cashback","bus", "challengebo"]
    var nib = UINib(nibName: "CellCollectionCollectionViewCell", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavgationBar()
       //setupTabBarItem()
      tabBarView.delegate = self
        tabBarView2.isHidden = true
        collectionView.register(nib,  forCellWithReuseIdentifier: "cell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
            collectionView.backgroundColor = FlatGrayDark()
         
        }
        //collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        welcomeAlert()
        dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupNavgationBar(){
       
        navigationItem.title = " Round 1 "
        //let leftButton = UIBarButtonItem(image: UIImage(named: "homeIcon"), style: .plain, target: nil, action: nil)
        // let rightButton = UIBarButtonItem(image: UIImage(named: "update"), style: .plain, target: nil, action: nil)
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage(named: "homeIcon"), for: .normal)
        leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let item1 = UIBarButtonItem(customView: leftButton)
        
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(UIImage(named: "update"), for: .normal)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        // rightButton.addTarget(self, action: #selector(Class.MethodName), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: rightButton)
        self.navigationItem.setLeftBarButton(item1, animated: true)
        self.navigationItem.setRightBarButton(item2, animated: true)
    }
    func setupTabBarItem(){
        
        var tabBarViewItem = [UITabBarItem]()
        let tabBarItem1 = (self.tabBarView.items![0]) as UITabBarItem
        tabBarItem1.title = "レーン予約88"
        tabBarViewItem.append(tabBarItem1)
        let tabBarItem2 = (self.tabBarView.items![1]) as UITabBarItem
        tabBarItem2.title = "店舗検索"
         tabBarViewItem.append(tabBarItem2)
        
        
    }
    func welcomeAlert(){
      let alert = UIAlertController(title: "Welcome", message: "RoundOne", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
}
}




extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionCollectionViewCell
        cell.imgView.image = UIImage(named: pictures[indexPath.item])
        cell.imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(collectionView(_:didSelectItemAt:))))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let url = NSURL(string: "https://www.yahoo.com.hk")!
       
        if pictures[indexPath.item] == "megapack" {
            
             UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            print(url)
            print("hihih")
            
        }else {
            print(pictures[indexPath.item])
        }
    }
   
    
}
