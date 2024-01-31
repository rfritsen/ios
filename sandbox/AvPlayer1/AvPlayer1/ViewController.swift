//
//  ViewController.swift
//  AvPlayer1
//
//  Created by Ryan on 1/5/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    struct PlayerView: UIViewRepresentable {
      func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
      }
      func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
      }
    }
        
        
    }

    

}

