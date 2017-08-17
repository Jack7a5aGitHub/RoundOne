//
//  ViewController.swift
//  Round One
//
//  Created by Jack Wong on 2017/08/15.
//  Copyright © 2017年 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    

    var pictures = ["megapack","cashback","bus"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavgationBar()
      
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
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = UIImage(named: pictures[indexPath.item])
       
        
        return cell
    }
    
  //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {}
    

}
