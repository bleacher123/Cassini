//
//  ImageViewController.swift
//  Cassini
//
//  Created by teriyakibob on 2017/3/15.
//  Copyright © 2017年 hoodsound. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var  imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
            fetchImage()
            }
        }
    }
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private func fetchImage() {
        if let url = imageURL {
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents,  url == self?.imageURL {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: imageData)
                 }
                
                }
             }
        }
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    imageURL = DemoURL.stanford
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if image == nil {
            fetchImage()
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.05
            scrollView.maximumZoomScale = 2.0
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
        }
    }
    fileprivate var imageView = UIImageView()
    
    private var image : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
             self.scrollView?.contentSize = imageView.frame.size
            
            spinner?.stopAnimating()
        }
    }
    
    
}

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    // 让图片缩放处于中间，否则为左上角
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        var xCenter = scrollView.center.x
        var yCenter = scrollView.center.y
        xCenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width / 2 : xCenter
        yCenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : yCenter
        imageView.center = CGPoint(x: xCenter, y: yCenter)
        
        
       
        
           }
}
