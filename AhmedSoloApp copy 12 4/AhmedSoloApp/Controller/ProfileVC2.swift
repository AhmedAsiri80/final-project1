//
//  ProfileVC2.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 10/05/1443 AH.
//
//
//import UIKit
//import FirebaseFirestore
//import Firebase
//
//
//class ProfileVC : UIViewController, UIImagePickerControllerDelegate,UITextFieldDelegate, UINavigationControllerDelegate{
//
//
//    @IBOutlet weak var images: UIImageView!
//
//    @IBOutlet weak var nameTF: UITextField!
//    @IBOutlet weak var SaveB: UIButton!
//
//    lazy var imagePicker : UIImagePickerController = {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = true
//        return imagePicker
//    }()
//
//
//    @objc func OpenImage(_ sender: Any) {
//        let pick = UIImagePickerController()
//        pick.allowsEditing = true
//        pick.delegate = self
//        present(pick, animated: true)
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
//        images.image = image
//        dismiss(animated: false)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
//        images.addGestureRecognizer(tapRecognizer)
//
//
//
//
//        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//        Firestore.firestore()
//            .document("users/\(currentUserID)")
//            .addSnapshotListener{ doucument, error in
//                if error != nil {
//                    print (error as Any)
//                    return
//                }
//                self.nameTF.text = doucument?.data()?["name"] as? String
//
//                self.images.image = doucument?.data()?["image"] as? UIImage
//
//            }
//    }
//
//
//    @objc func imageTapped() {
//        print("Image tapped")
//        present(imagePicker, animated: true)
//    }
//
//    @objc func haB() {
//        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//        Firestore.firestore().document("users/\(currentUserID)").setData([
//            "name" : nameTF.text as Any,
//            "id" : currentUserID,
//            "image" : "\(images.image)" as Any,
//        ],merge: true)
//        let alert1 = UIAlertController(
//            title: ("Saved"),
//            message: "Saved update data",
//            preferredStyle: .alert)
//        alert1.addAction(
//            UIAlertAction(
//                title: "OK",
//                style: .default,
//                handler: { action in
//                    print("OK")
//                }
//            )
//        )
//        present(alert1, animated: true, completion: nil)
//    }
//
//    }
//
//
//
//

import UIKit
import FirebaseFirestore
import Firebase


class ProfileVC : UIViewController, UIImagePickerControllerDelegate,UITextFieldDelegate, UINavigationControllerDelegate{
    
    
    
    lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 25
        view.isUserInteractionEnabled = true
        return view
    }()
    lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        return imagePicker
    }()
    let name : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Write your name"
        $0.backgroundColor = .init(white: 0.85, alpha: 1)
        $0.layer.cornerRadius = 22.5
        $0.textAlignment = .center
        return $0
    }(UITextField())
    
    let Button : UIButton = {
        $0.backgroundColor = .black
        $0.setTitle("Save", for: .normal)
        $0.tintColor = .black
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(haB), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    @objc func OpenImage(_ sender: Any) {
        let pick = UIImagePickerController()
        pick.allowsEditing = true
        pick.delegate = self
        present(pick, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
        profileImage.image = image
        dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profileImage.addGestureRecognizer(tapRecognizer)
        
        view.backgroundColor = .white
        profileImage.image = .init(systemName: "45")
        profileImage.tintColor = UIColor(ciColor: .black)
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 100
        profileImage.contentMode = .scaleAspectFit
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200)
        ])
        name.font = .boldSystemFont(ofSize: 23)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor,constant: 440),
            name.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 50),
            name.heightAnchor.constraint(equalToConstant: 40),
            name.widthAnchor.constraint(equalToConstant: 290),
            //name.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: 100)
        ])
        
        view.addSubview(Button)
        NSLayoutConstraint.activate([
            Button.topAnchor.constraint(equalTo: view.topAnchor,constant: 570),
            //      Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            Button.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        
        
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error as Any)
                    return
                }
                self.name.text = doucument?.data()?["name"] as? String
                
                self.profileImage.image = doucument?.data()?["image"] as? UIImage
                
            }
    }
    
    
    @objc func imageTapped() {
        print("Image tapped")
        present(imagePicker, animated: true)
    }
    
    @objc func haB() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").setData([
            "name" : name.text as Any,
            "id" : currentUserID,
            "image" : "\(profileImage.image)" as Any,
        ],merge: true)
        let alert1 = UIAlertController(
            title: ("Saved"),
            message: "Saved update data",
            preferredStyle: .alert)
        alert1.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    print("OK")
                    self.performSegue(withIdentifier: "12345", sender: nil)
                }
            )
        )
        present(alert1, animated: true, completion: nil)
    }
    
}




