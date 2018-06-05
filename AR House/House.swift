//
//  House.swift
//  AR House
//
//  Created by Denis Bystruev on 04/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
import ARKit

// Class which contains node with the house model and exposes some of node's properties
class House {
    let node: SCNNode
    
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
    
    var name: String? {
        get {
            return node.name
        }
        set {
            node.name = newValue
        }
    }
    
    init(fileName: String) {
        if let node = SCNScene(named: fileName)?.rootNode.clone() {
            self.node = node
        } else {
            self.node = SCNNode()
        }
    }
}
