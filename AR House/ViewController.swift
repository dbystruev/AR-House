//
//  ViewController.swift
//  AR House
//
//  Created by Denis Bystruev on 03/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
//  The house model is by Denniswoo1993 (https://www.turbosquid.com/Search/Artists/denniswoo1993)
//  from https://www.turbosquid.com/3d-models/free-3ds-mode-dreamhome-architectural-assets/1125654

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    // Name of the node with the house
    let nodeName = "House"
    
    // True if the house is shown
    var house_shown = false
    
    // Scale to take the model back to normal size
    let scale: Float = 0.01
    
    // Position to set model properly
    let position = SCNVector3(0, -2, -10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Load the empty scene to the view
        sceneView.scene = SCNScene()
        
        // Enable default lighting
        sceneView.autoenablesDefaultLighting = true
        
        // Add tap gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapHandler(_:)))
        tap.delegate = self
        sceneView.addGestureRecognizer(tap)
        
        // Add swipe gesture recognizers
        for direction in [UISwipeGestureRecognizerDirection.left, .right, .up, .down] {
            addSwipeGestureRecognizer(for: direction)
        }
    }
    
    // Add tap gesture recognizer for certain direction
    func addSwipeGestureRecognizer(for direction: UISwipeGestureRecognizerDirection) {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeHandler(_:)))
        swipe.delegate = self
        swipe.direction = direction
        sceneView.addGestureRecognizer(swipe)
    }
    
   // Handle tap gestures
    @objc func tapHandler(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            if house_shown {
                removeHouse()
            } else {
                addHouse()
            }
            
            // Revert the house is shown flag
            house_shown = !house_shown
        }
    }
    
    // Handle swipe gestures
    @objc func swipeHandler(_ gestureRecognizer: UISwipeGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            switch gestureRecognizer.direction {
            case .left:
                // do nothing
                print(#function, gestureRecognizer.direction)
            case .right:
                // do nothing
                print(#function, gestureRecognizer.direction)
            case .up:
                // move house up by 1 meter
                moveHouse(by: 1)
            case .down:
                // move house down by 1 meter
                moveHouse(by: -1)
            default:
                // should not be here actually
                print(#function, gestureRecognizer.direction)
            }
        }
    }
    
    /// Add a house from DAE file to the scene
    func addHouse() {
        // Create a node from DAE file
        let node = SCNScene(named: "art.scnassets/Dreamhome Example 1.dae")!.rootNode.clone()
        
        // Get a camera node
        let cameraNode = sceneView.pointOfView!
        
        // Set a node where a camera is
        node.transform = cameraNode.transform
        
        // Shrink the node 100 times
        node.scale = SCNVector3(scale, scale, scale)
        
       // Move a node to position the house properly
        node.position = position
  
        // Name the node so we can find it later
        node.name = nodeName
        
        // Add a node to the scene
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    // Remove the house from the scene
    func removeHouse() {
        // Find the node with the name
        if let node = sceneView.scene.rootNode.childNode(withName: nodeName, recursively: true) {
            node.removeFromParentNode()
        }
    }
    
    // Move house up and down (on Y axis)
    func moveHouse(by delta: Float) {
        // Find the node with the name
        if let node = sceneView.scene.rootNode.childNode(withName: nodeName, recursively: true) {
            node.position.y += delta
        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
