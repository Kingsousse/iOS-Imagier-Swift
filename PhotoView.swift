//
//  PhotoView.swift
//  Imagier
//
//  Created by m2sar on 27/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import UIKit
import Foundation

class PhotoView : UIView,UIScrollViewDelegate { 
    
    private let terminal = UIDevice.currentDevice()
    private let screen   = UIScreen.mainScreen()
    private let scrollV = UIScrollView(frame:UIScreen.mainScreen().bounds)
    
    private let imageGest = ImageGestionnaire()
    
    private var photoIndx:(String,String,Double)
    
    private var monImageView:UIImageView
    
    private var ImageName: UILabel
    private var Previous : UIButton
    private var Next : UIButton
    private var Echelle : UILabel
    private var slider : UISlider
    
    private var zoomEchelle:Double = 0
    
    override init (frame:CGRect){
     
        photoIndx = imageGest.getNextPhoto()
        zoomEchelle = photoIndx.2
        //Label Name
        ImageName = UILabel()
        ImageName.text = photoIndx.1;
        ImageName.textAlignment = .Center
        ImageName.backgroundColor = UIColor.whiteColor()
        
        
        //Previous Button
        Previous = UIButton()
        Previous.setTitle("<<<",forState: .Normal);
        Previous.setTitle("",forState: .Highlighted);
        Previous.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        
        //Next Button
        
        Next = UIButton()
        Next.setTitle(">>>",forState: .Normal);
        Next.setTitle("",forState: .Highlighted);
        Next.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        
        //Label Echelle 
        
        Echelle = UILabel()
        Echelle.text = "\(Int(zoomEchelle * 100))"+" %"
        Echelle.textAlignment = .Center
        Echelle.backgroundColor = UIColor(white: 1.0, alpha: 0.5)

        
        
        //Slider
        
        slider = UISlider()
        slider.minimumValue = 0.05
        slider.maximumValue = 1.0
        slider.value = Float(zoomEchelle)
        
        //Image 
        monImageView = UIImageView(image: UIImage(named: photoIndx.0))
        
        super.init(frame:frame)
        
        scrollV.maximumZoomScale = 1.0
        scrollV.minimumZoomScale = 0.05
        scrollV.delegate = self
        scrollV.addSubview(monImageView)
        scrollV.setZoomScale(0.1, animated: true)
        
        //parallele axe
        let effetH = UIInterpolatingMotionEffect(keyPath:"center.x", type: UIInterpolatingMotionEffectType.TiltAlongHorizontalAxis)
        effetH.minimumRelativeValue = -50.00
        effetH.maximumRelativeValue = 50.00
        
        let effetV = UIInterpolatingMotionEffect(keyPath:"center.y", type: UIInterpolatingMotionEffectType.TiltAlongVerticalAxis)
        effetV.minimumRelativeValue = -50.00
        effetV.maximumRelativeValue = 50.00
        scrollV.addMotionEffect(effetH)
        scrollV.addMotionEffect(effetV)
        
        
        self.addSubview(scrollV)
        self.addSubview(monImageView)
        self.addSubview(ImageName)
        self.addSubview(Echelle)
        self.addSubview(Previous)
        self.addSubview(Next)
        self.addSubview(slider)
        
       
        
        Next.addTarget(self, action: "NextAction:", forControlEvents: .TouchUpInside)
        Previous.addTarget(self, action: "PreviousAction:", forControlEvents: .TouchUpInside)
        slider.addTarget(self, action: "SliderAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        var x:CGFloat = 0
        var y:CGFloat = 28
        
        ImageName.frame = CGRectMake(x,y, rect.width, 30)
        x = 25
        Previous.frame = CGRectMake(x, y, 35, 30)
        x = rect.width-25-30
        Next.frame = CGRectMake(x, y, 35, 30)
        y+=30
        x=0
        Echelle.frame = CGRectMake(x, y, rect.width, 30)
        monImageView.frame = CGRectMake(x, y, rect.width, rect.height-y)
        
        x=14
        y=rect.height-20
        
        slider.frame = CGRectMake(x, y - slider.frame.height, rect.width-2*x, slider.frame.height)
        
        
    
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) ->UIView? {
       
        return monImageView;
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        scrollView.zoomScale = scale
    }
    
    
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        zoomEchelle = Double(scrollView.zoomScale)
        slider.value = Float(zoomEchelle)
        Echelle.text = "\(Int(zoomEchelle * 100))"+" %"
    }
    
    @IBAction func NextAction(sender: UIButton) {
        photoIndx = imageGest.getNextPhoto()
        //println(photoIndx)
        zoomEchelle = photoIndx.2
        monImageView.image = UIImage(named: photoIndx.0)
        scrollV.setZoomScale(CGFloat(zoomEchelle), animated: true)
        slider.value = Float(photoIndx.2)
        Echelle.text = "\(Int(photoIndx.2 * 100))"+" %"
        ImageName.text = photoIndx.1;
        
    }
    
    @IBAction func PreviousAction(sender: UIButton) {
        photoIndx = imageGest.getPrevPhoto()
        zoomEchelle = photoIndx.2
        monImageView.image = UIImage(named: photoIndx.0)
        scrollV.setZoomScale(CGFloat(zoomEchelle), animated: true)
        slider.value = Float(photoIndx.2)
        Echelle.text = "\(Int(photoIndx.2 * 100))"+" %"
        ImageName.text = photoIndx.1;
    }
    
    @IBAction func SliderAction(sender: UISlider) {
        zoomEchelle = Double(slider.value)
        Echelle.text = "\(Int(zoomEchelle * 100))"+" %"
        scrollV.setZoomScale(CGFloat(zoomEchelle), animated: true)

    }
    
    
}