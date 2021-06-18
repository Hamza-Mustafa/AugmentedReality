//
//  ViewController.swift
//  ARCubeBox
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
        
        // chamferRadius is cornedRadius basically
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        // By Default color of SCNBOX is white
        // SCNMaterial represents appearance of geometry object
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.yellow
        cube.materials = [material]
        
        // SCNNode represents position of 3D object
        let node = SCNNode()
        // SCNVector3 represents x,y,z vector
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = cube
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
