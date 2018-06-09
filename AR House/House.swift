//
//  House.swift
//  AR House
//
//  Created by Denis Bystruev on 04/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
import ARKit

/// Class which contains node with the house model and exposes some of node's properties
class House {
    let node: SCNNode
    
    var eulerAngles: SCNVector3 {
        get {
            return node.eulerAngles
        }
        set {
            node.eulerAngles = newValue
        }
    }
    
    var geometry: SCNGeometry? {
        get {
            return node.geometry
        }
        set {
            node.geometry = newValue
        }
    }
    
    var name: String? {
        get {
            return node.name
        }
        set {
            node.name = newValue
        }
    }
    
    var position: SCNVector3 {
        get {
            return node.position
        }
        set {
            node.position = newValue
        }
    }
    
    var rotation: SCNVector4 {
        get {
            return node.rotation
        }
        set {
            node.rotation = newValue
        }
    }
    
    var scale: SCNVector3 {
        get {
            return node.scale
        }
        set {
            node.scale = newValue
        }
    }
    
    var simdPosition: simd_float3 {
        get {
            return node.simdPosition
        }
        set {
            node.simdPosition = newValue
        }
    }
    
    var worldPosition: SCNVector3 {
        get {
            return node.worldPosition
        }
        set {
            node.worldPosition = newValue
        }
    }
    
    init(_ fileName: String = "") {
        if let node = SCNScene(named: fileName)?.rootNode.clone() {
            self.node = node
        } else {
            self.node = SCNNode()
        }
   
//        Uncomment to get numbers displayed at the floor when looking from below
//        for x in -10...10 {
//            for z in -10...10 {
//                let text = SCNNode(geometry: SCNText(string: "\(x):\(z)", extrusionDepth: 1))
//                (text.position.x, text.position.z) = (100 * Float(x), 100 * Float(z))
//                text.eulerAngles.x += .pi / 2
//                node.addChildNode(text)
//            }
//        }
    }
    
    /// Move house's rotation point
    /// - parameters:
    ///     - by: the vector by which the house's center should be moved
    func moveHouseRotationPoint(by vector: SCNVector3) {
        // move the house origin by vector
        for node in node.childNodes {
            node.position -= vector
        }
    }
}
