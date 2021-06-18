//
//  ViewController.swift
//  ARDice
//
//  Created by Hamza Mustafa on 17/06/2021.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //You can also check if world tracking is supported on a device:

        if ARWorldTrackingConfiguration.isSupported {
            // Create a session configuration for A9 chipset
            let configuration = ARWorldTrackingConfiguration()
            // Run the view's session
            sceneView.session.run(configuration)
            print("World Tracking is supported = \(ARWorldTrackingConfiguration.isSupported)")
            print("Session is supported = \(ARConfiguration.isSupported)")
        }
        else {
            // Create a session configuration for A8 chipset
            let configuration = AROrientationTrackingConfiguration()
            // Run the view's session
            sceneView.session.run(configuration)
            print("World Tracking is supported = \(ARWorldTrackingConfiguration.isSupported)")
            print("Session is supported = \(ARConfiguration.isSupported)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
