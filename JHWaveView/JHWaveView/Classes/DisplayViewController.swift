//
//  ViewController.swift
//  JHWaveView
//
//  Created by rookie on 2017/6/20.
//  Copyright © 2017年 mamahome. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    @IBOutlet weak var displayImageView: UIImageView!
    let waveLoadingIndicator: WaveLoadingIndicator = WaveLoadingIndicator(frame: CGRect.zero)
    
//    let url = NSURL(string: "http://www.quyundong.com/uploads/1080_1920.jpg")
    let url = URL(string: "https://raw.githubusercontent.com/liuzhiyi1992/MyStore/master/DSC_0865.JPG")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure() {
        self.displayImageView.addSubview(self.waveLoadingIndicator)
        self.waveLoadingIndicator.frame = self.displayImageView.bounds
        self.waveLoadingIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.displayImageView.sd_setImage(with: url, placeholderImage: nil, options: .cacheMemoryOnly, progress: {
            [weak self](receivedSize, expectedSize) -> Void in
            
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.waveLoadingIndicator.progress = Double(CGFloat(receivedSize)/CGFloat(expectedSize))
        }) {
            [weak self](image, error, _, _) -> Void in
            
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.waveLoadingIndicator.removeFromSuperview()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// 版权属于原作者
// 个人博客 zyden.vicp.cc

