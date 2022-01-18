//
//  QiblahVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 04/05/1443 AH.
//

import Foundation

import UIKit
import CoreLocation

class QiblahDirectionPage: UIViewController {
    
    var compassManager  : CompassDirectionManager!
    
    var screenWidth = CGFloat()
    var screenHeight = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        
        self.navigationController?.isNavigationBarHidden = false
        
        screenHeight = self.view.frame.size.height
        screenWidth = self.view.frame.size.width
        
        let navBarHeight = UIApplication.shared.statusBarFrame.height+30
        
        //Direction backgroun imageView
        let directionImage = UIImageView()
        if UIDevice.current.model.hasPrefix("iPad") {
            directionImage.frame = CGRect(x:screenWidth/2-screenWidth/4 ,y:navBarHeight ,width:screenWidth/2 ,height:screenHeight/3.5)
        } else {
            directionImage.frame = CGRect(x:screenWidth/2-screenWidth/4 ,y:navBarHeight ,width:screenWidth/2 ,height:screenHeight/4)
            if UIDevice().userInterfaceIdiom == .phone {
                switch UIScreen.main.nativeBounds.height {
                    
                case 2436:
                    print("iPhone X")
                    directionImage.frame = CGRect(x:screenWidth/2-screenWidth/4 ,y:navBarHeight ,width:screenWidth/2 ,height:(screenHeight/4)-40)
                default:
                    print("unknown")
                }
            }
        }
        directionImage.image = #imageLiteral(resourceName: "directions")
        directionImage.contentMode = .scaleAspectFit
        directionImage.isUserInteractionEnabled = true
        self.view.addSubview(directionImage)
        
        //Compass Imageview creation
        let compassImage = UIImageView()
        if UIDevice.current.model.hasPrefix("iPad") {
            let widthImage = directionImage.frame.size.width/2-25
            compassImage.frame = CGRect(x:(directionImage.frame.size.width/2-directionImage.frame.size.width/4)+12 ,y:(directionImage.frame.size.height-directionImage.frame.size.width/2)+20 ,width:widthImage ,height:widthImage)
        } else {
            compassImage.frame = CGRect(x:directionImage.frame.size.width/2-directionImage.frame.size.width/4 ,y:directionImage.frame.size.height-directionImage.frame.size.width/2-3 ,width:directionImage.frame.size.width/2 ,height:directionImage.frame.size.width/2)
        }
        compassImage.image = #imageLiteral(resourceName: "Compass")
        compassImage.contentMode = .scaleAspectFit
        //compassImage.backgroundColor = .red
        directionImage.addSubview(compassImage)
        
        //Qiblah Direction image Creation
        let directionArrowImage = UIImageView()
        if UIDevice.current.model.hasPrefix("iPad") {
            directionArrowImage.frame = CGRect(x:directionImage.frame.size.width/2-50 ,y:directionImage.frame.size.height-150 ,width:100 ,height:100)
        }else{
            directionArrowImage.frame = CGRect(x:directionImage.frame.size.width/2-directionImage.frame.size.width/4 ,y:directionImage.frame.size.height/2-(directionImage.frame.size.width/6-25) ,width:directionImage.frame.size.width/2 ,height:(directionImage.frame.size.width/2)-20)
        }
        directionArrowImage.image = #imageLiteral(resourceName: "check1")
        directionArrowImage.contentMode = .scaleAspectFit
        //directionArrowImage.backgroundColor = .green
        directionImage.addSubview(directionArrowImage)
        
        
        //SetUP Direction Third party method
        compassManager =  CompassDirectionManager(dialerImageView: compassImage, pointerImageView: directionArrowImage)
        compassManager.initManager()
        
        
        let directionLabel = UILabel()
        directionLabel.frame = CGRect(x:10 ,y:screenHeight-screenHeight/4 ,width:screenWidth-20 ,height:45)
        directionLabel.text = "Qiblah" + " " + "Direction" + " " + "291°"
        directionLabel.font = UIFont.systemFont(ofSize: 22)
        directionLabel.textColor = UIColor.black
        directionLabel.textAlignment = .center
        self.view.addSubview(directionLabel)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        // self.view = GradientView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            if let viewControllers = self.navigationController?.viewControllers {
                if (viewControllers.count >= 1) {
                    let transition = CATransition()
                    transition.duration = 0.5
                    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                    transition.type = CATransitionType.fade
                    transition.subtype = CATransitionSubtype.fromBottom
                    navigationController?.view.layer.add(transition, forKey:kCATransition)
                    let _ = navigationController?.popViewController(animated: false)
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


import CoreLocation



class CompassDirectionManager: NSObject , CLLocationManagerDelegate{
    
    var dialerImageView : UIImageView!
    var pointerImageView : UIImageView!
    
    private var latOfOrigin = 21.4225
    private var lngOfOrigin = 39.8262
    
    private var location: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    var bearingOfKabah = Double()
    
    init(dialerImageView : UIImageView , pointerImageView : UIImageView) {
        self.dialerImageView = dialerImageView
        self.pointerImageView = pointerImageView
    }
    
    
    func initManager(){
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
            
        }
    }
    
    func setOrigin(lat : Double , lng : Double){
        self.latOfOrigin = lat
        self.lngOfOrigin = lng
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        
        
        let north = -1 * heading.magneticHeading * Double.pi/180
        
        let directionOfKabah = bearingOfKabah * Double.pi/180 + north
        
        dialerImageView.transform =     CGAffineTransform(rotationAngle: CGFloat(north));
        
        pointerImageView.transform =       CGAffineTransform(rotationAngle: CGFloat(directionOfKabah));
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last!
        
        location = newLocation
        
        bearingOfKabah = getBearingBetweenTwoPoints1(location!, latitudeOfOrigin: self.latOfOrigin, longitudeOfOrigin: self.lngOfOrigin) //calculating the bearing of KABAH
    }
    
    
    private func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
    
    
    private  func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
    
    private  func getBearingBetweenTwoPoints1(_ point1 : CLLocation, latitudeOfOrigin : Double , longitudeOfOrigin :Double) -> Double {
        
        let lat1 = degreesToRadians(point1.coordinate.latitude)
        let lon1 = degreesToRadians(point1.coordinate.longitude)
        
        let lat2 = degreesToRadians(latitudeOfOrigin);
        let lon2 = degreesToRadians(longitudeOfOrigin);
        
        let dLon = lon2 - lon1;
        
        let y = sin(dLon) * cos(lat2);
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
        var radiansBearing = atan2(y, x);
        if(radiansBearing < 0.0){
            
            radiansBearing += 2 * Double.pi;
            
        }
        
        return radiansToDegrees(radiansBearing)
    }
}

