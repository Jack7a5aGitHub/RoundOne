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
    
    
    var pictures = ["megapack","cashback","bus","challengebo","cashback","bus","megapack","cashback","bus", "challengebo"]
    var nib = UINib(nibName: "CellCollectionCollectionViewCell", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavgationBar()
        collectionView.register(nib,  forCellWithReuseIdentifier: "cell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        //collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionCollectionViewCell
        cell.imgView.image = UIImage(named: pictures[indexPath.item])
        cell.imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(collectionView(_:didSelectItemAt:))))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let webView = UIWebView()
        let url = NSURL(string: "www.yahoo.com.hk")!
        let request = URLRequest(url: url as URL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        if pictures[indexPath.item] == "megapack" {
            
            // UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            webView.loadRequest(request)
            print("hihih")
            
        }else {
            print(pictures[indexPath.item])
        }
    }
   
    
   /*
    func tap(){
        print("test")
        
    }
    */
    /*
     func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath, withWidth: CGFloat) -> CGFloat {
     
     let picture = UIImage(named: pictures[indexPath.item])
     let boundRect = CGRect(x: 0, y: 0, width: withWidth, height: CGFloat(MAXFLOAT))
     let rect = AVMakeRect(aspectRatio: (picture?.size)!, insideRect: boundRect)
     return rect.size.height
     
     
     }
     
     func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
     let annotationPadding = CGFloat(4)
     let annotationHeaderHeight = CGFloat(17)
     let font = UIFont(name: " Hihi I am Tester ", size: 10)
     let pic = pictures[indexPath.item]
     let commentHeight = pic.heightForComment(font: font!, width: width)
     let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
     return height
     }
     
     func heightForComment(font: UIFont, width: CGFloat) -> CGFloat {
     let rect = NSString(string: comment!).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
     return ceil(rect.height)
     }
     */
    
    
    
    
    
}
