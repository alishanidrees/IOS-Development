//
//  OnBoaridngViewController.swift
//  IOSecondProject
//
//  Created by Ali Shan on 08/11/2023.
//

import Foundation
import UIKit

class OnBoaridngViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let pages: [Page] = [
        Page(onboardingImage: UIImage(named: "ic_onboarding_1")!
             ,title: "Perform Umrah", description: "Lorem Ipsum is a simple dummy text which can be used in the designs as sample content."),
        Page(onboardingImage: UIImage(named: "ic_onboarding_2")!
             ,title: "Umrah Tracking", description: "Lorem Ipsum is a simple dummy text which can be used in the designs as sample content."),
        Page(onboardingImage: UIImage(named: "ic_onboarding_3")!
             ,title: "Chat Feature", description: "Lorem Ipsum is a simple dummy text which can be used in the designs as sample content."),
        Page(onboardingImage: UIImage(named: "ic_onboarding_4")!
             ,title: "Secure Payment", description: "Lorem Ipsum is a simple dummy text which can be used in the designs as sample content.")
    ]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath) as! OnBoardingCollectionViewCell
        //   cell.confi
        cell.configureDataCell(page: pages[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    // to update the UIPageControl
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: OnBoardingCollectionViewCell.identifier, bundle: Bundle.main),
                                     forCellWithReuseIdentifier: "OnBoardingCollectionViewCell")
        self.pageControl.numberOfPages = pages.count
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnSkip(_ sender: Any) {
        navigateToPaymentHistory()
    }
    
    @IBAction func btnContinue(_ sender: Any) {
        
        if  pageControl.currentPage == 3  {
            navigateToPaymentHistory()
        } else {
        
            let nextIndex = pageControl.currentPage + 1
            let indexPath = IndexPath(item: nextIndex, section: 0)
            pageControl.currentPage = nextIndex
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        //        let pc = sender as! UIPageControl
        //        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        
    }
    
    @IBAction func pageChanged(_ sender: Any) {
        //        let pc = sender as! UIPageControl
        //        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    private func navigateToPaymentHistory(){
        guard let paymentHistory = (self.storyboard?.instantiateViewController(identifier: "PaymentHistoryViewController") as? PaymentHistoryViewController) else {
            return
        }
        self.navigationController?.pushViewController(paymentHistory, animated: true)
    }
    
    
}
