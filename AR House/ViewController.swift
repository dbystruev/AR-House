//
//  ViewController.swift
//  AR House
//
//  Created by Denis Bystruev on 03/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
//  The house model is by Denniswoo1993 (https://www.turbosquid.com/Search/Artists/denniswoo1993)
//  from https://www.turbosquid.com/3d-models/free-3ds-mode-dreamhome-architectural-assets/1125654

import ARKit
import Foundation
import SceneKit
import UIKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, UIGestureRecognizerDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    /// Distance from the viewer in meters
    let distance: Float = 10
    
    /// Name of the node with the house
    let houseNodeName = "House"
    
    /// True if the house is shown
    var houseShown = false
 
    /// Move the point inside the model around which it should rotate by this vector
    let rotationPoint = SCNVector3(2, 0, -5)

    /// Scale to take the model back to normal size
    let houseScale: Float = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the starting coordinates
//        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Set the sessions's delegate
        sceneView.session.delegate = self
        
        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
        
        // Load the empty scene to the view
        sceneView.scene = SCNScene()
        
        // Enable default lighting
        sceneView.autoenablesDefaultLighting = true
        
        // Add tap and swipe gesture recognizers
        addGestureRecognizers()
    }
    
    /// Add pan, pinch, and tap gesture recognizers
    func addGestureRecognizers() {
        // Add pan gesture recognizer
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panHandler(_:)))
        pan.delegate = self
        sceneView.addGestureRecognizer(pan)
        
        // Add pinch handler recognizer
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchHandler(_:)))
        pinch.delegate = self
        sceneView.addGestureRecognizer(pinch)
        
        // Add tap gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        tap.delegate = self
        sceneView.addGestureRecognizer(tap)
    }
    
    /// Handle pan gesture
    @objc func panHandler(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: sceneView)
        
        rotateHouse(by: Float(translation.x) / 100)
        moveHouse(by: -Float(translation.y) / 100)
        
        recognizer.setTranslation(.zero, in: sceneView)
    }
    
    /// Handle pinch gesture
    @objc func pinchHandler(_ recognizer: UIPinchGestureRecognizer) {
        let scale = Float(1 / recognizer.scale)
        
        // Find the node with the house name
        if let node = sceneView.scene.rootNode.childNode(withName: houseNodeName, recursively: true),
            let pov = sceneView.pointOfView {
            
            // Original (camera) position
            let x1 = pov.position.x
            let z1 = pov.position.z
            
            // Target (house) position
            let x2 = node.position.x
            let z2 = node.position.z
            
            // Get the house new position
            node.position.x = x1 + scale * (x2 - x1)
            node.position.z = z1 + scale * (z2 - z1)
        }
        
        recognizer.scale = 1
    }
    
    /// Handle tap gestures
    @objc func tapHandler(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            if houseShown {
                removeHouse()
            } else {
                addHouse()
            }
            
            // Revert the house is shown flag
            houseShown = !houseShown
        }
    }
    
    /// Add a house from DAE file to the scene
    func addHouse() {
        // Create a house from DAE file
        let house = House("art.scnassets/Dreamhome Example 1.dae")
        
        // Move house rotation point
        house.moveHouseRotationPoint(by: rotationPoint / NSNumber(value: houseScale))
        
        // Shrink the house 100 times
        house.scale = SCNVector3(houseScale, houseScale, houseScale)
        
        // Name the house node so we can find it later
        house.name = houseNodeName
        
        // Add the house before the camera at distance
        if let cameraNode = sceneView.pointOfView {
            house.simdPosition = cameraNode.simdWorldFront * distance
        }
        
        // Add the house node to the scene
        sceneView.scene.rootNode.addChildNode(house.node)
    }
    
    /// Remove the house from the scene
    func removeHouse() {
        // Find the node with the house name
        if let node = sceneView.scene.rootNode.childNode(withName: houseNodeName, recursively: true) {
            node.removeFromParentNode()
        }
    }
    
    /// Move house up and down (on Y axis)
    func moveHouse(by delta: Float) {
        // Find the node with the house name
        if let node = sceneView.scene.rootNode.childNode(withName: houseNodeName, recursively: true) {
            node.position.y += delta
        }
    }
    
    /// Rotate house around vertical (Y) axis
    func rotateHouse(by angle: Float) {
        // Find the node with the name
        if let node = sceneView.scene.rootNode.childNode(withName: houseNodeName, recursively: true) {
            node.eulerAngles.y += angle
        }
    }
    
    // Called every time when frame is updated
//    func session(_ session: ARSession, didUpdate frame: ARFrame) {
//    }
    
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
