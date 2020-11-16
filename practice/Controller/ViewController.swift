//
//  ViewController.swift
//  practice
//
//  Created by Ishaan Gupta 2 on 11/14/20.
//

import UIKit



class ViewController: UIViewController {

  let openWeatherURL = "https://api.openweathermap.org/data/2.5/weather?uk&APPID=dceca2d24ca0672207edcabceab40a46&units=metric&q=London"
  let reusableId = "collectionCell"
  
  var collectionView: UICollectionView!
  private var pageView = UIPageViewController()
  private var tabs = ["Menu TAB 1","Menu TAB 2","Menu TAB 3","Menu TAB 4","Menu TAB 5","Menu TAB 6"]
  var currentIndex: Int = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    let flowLayout = UICollectionViewFlowLayout()
//    print("spacing req \((view.frame.width - 4*60 - 20)/3)")
    flowLayout.minimumLineSpacing = 0
    flowLayout.scrollDirection = .horizontal
    self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
    collectionView.register(CollectionViewCellData.self, forCellWithReuseIdentifier: reusableId)
    collectionView.delegate = self
    collectionView.dataSource = self
    setupCollectionView()
    setupPageView()
    pageView.delegate = self
    pageView.setViewControllers([viewController(At: 0)!], direction: .forward, animated: false, completion: nil)
  }
  
  func viewController(At index: Int) -> UIViewController? {
      
//      if((self.menuBarView.dataArray.count == 0) || (index >= self.menuBarView.dataArray.count)) {
//          return nil
//      }
      
      let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentVC
      contentVC.strTitle = tabs[index]
      contentVC.pageIndex = index
      currentIndex = index
      return contentVC
      
  }
  
  func setupPageView() {
    view.addSubview(pageView.view)
//    pageView.dataSource = self
    pageView.delegate = self
    
    pageView.view.translatesAutoresizingMaskIntoConstraints = false
    pageView.view.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
    pageView.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    pageView.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    pageView.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
    pageView.view.backgroundColor = .green
  }
  
  func setupCollectionView() {
    view.addSubview(collectionView)
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    collectionView.backgroundColor = .blue
    
//    collectionView.alwaysBounceVertical = true
//    collectionView.contentSize = CGSize(width: view.frame.width + 100, height: 200)
    
  }
}

//MARK:- UIPageView Delegate Code

extension ViewController: UIPageViewControllerDelegate {
//  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//    var index = (viewController as! ContentVC).pageIndex
//
//    if (index == 0) || (index == NSNotFound) {
//        return nil
//    }
//
//    index -= 1
//    return self.viewController(At: index)
//  }
//
//  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//    return nil
//    var index = (viewController as! ContentVC).pageIndex
//
//    if (index == tabs.count) || (index == NSNotFound) {
//        return nil
//    }
//
//    index += 1
//    return self.viewController(At: index)
//  }
  
}

//MARK:- UICollectionView Delegate Code

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableId, for: indexPath) as! CollectionViewCellData
    cell.backgroundColor = .brown
    cell.numlabel.text = "1"
    cell.numlabel.backgroundColor = .green
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("item selected \(indexPath.row)")
    pageView.setViewControllers([viewController(At: indexPath.row)!], direction: .forward, animated: false, completion: nil)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    print("wid is \(collectionView.frame.width/4)")
    return CGSize(width: collectionView.frame.width/4, height: 50)
  }
  
  
}

