//
//  ImageGestionnaire.swift
//  Imagier
//
//  Created by m2sar on 27/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import Foundation

class ImageGestionnaire {
    
    var taille: Int=0
    var count: Int
    
    let imagetab=[("photo-01.jpg", "Machu Pichu", 0.2),
        ("photo-02.jpg", "Oxford", 0.1),
        ("photo-03.jpg", "Dresde", 0.3),
        ("photo-04.jpg", "Chichen Itza",0.1),
        ("photo-05.jpg", "Kioto", 0.05),
        ("photo-06.jpg", "Gizeh",0.1),
        ("photo-07.jpg", "près d'Edimbourg",0.2),
        ("photo-08.jpg", "Cordoue",0.4),
        ("photo-09.jpg", "Seville",0.03),
        ("photo-10.jpg", "Grenade",0.4),
        ("photo-11.jpg", "Venise",0.1),
        ("photo-12.jpg", "Venise",0.2),
        ("photo-13.jpg", "Venise",0.3),
        ("photo-14.jpg", "Paris",0.3),
        ("photo-15.jpg", "Paris",0.1),
        ("photo-16.jpg", "Tiddis",0.2),
        ("photo-17.jpg", "Wahsington state",0.3),
        ("photo-18.jpg", "NGC 6302",0.2),
        ("photo-19.jpg", "New York",0.05),
        ("photo-20.jpg",  "La Terre",0.1)]
    
    
    init (){
        count = -1
        taille = imagetab.count
     
        println(Int(taille))
    }
    
    func photoURL (ind : Int) -> String {
        return imagetab[ind].0
    }
    
    func photoName (ind : Int) -> String {
        return imagetab[ind].1
    }
    
    func photoEchele (ind : Int) -> Double {
        return imagetab[ind].2
    }
    
    
    
    
    func getNextPhoto() ->(String, String, Double) {
        
        var str:String = ""
        var name:String = ""
        var echelle: Double = 1.0
        
        count++
        
        if count == taille-1 {
            count=0
        }
        
      
          
        str = imagetab[count].0
        name = imagetab[count].1
        echelle = imagetab[count].2
        if count == taille {
                count = 0
        }
        
        return (str, name, echelle)
        
    }
    
    
    
    
    func getPrevPhoto() ->(String, String,Double) {
        
        
        var str:String = ""
        var name:String = ""
        var echelle: Double = 1.0
        count--
        
        if count < 0 {
            count = taille-1
        }
        
        
            
            
        str = imagetab[count].0
        name = imagetab[count].1
        echelle = imagetab[count].2
            
        if count < 0 {
            count = taille-1
        }
            
            
        
        
        return (str, name, echelle)
        
    }

    
    
    
    
}
