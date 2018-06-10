//
//  SCNVector3Extension.swift
//  AR House
//
//  Created by Denis Bystruev on 03/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
import SceneKit

extension SCNVector3 {
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    
    static func + (left: SCNVector3, right: Float) -> SCNVector3 {
        return SCNVector3(left.x + right, left.y + right, left.z + right)
    }
    
    static func + (left: Float, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left + right.x, left + right.y, left + right.z)
    }
    
    static func += (left: inout SCNVector3, right: SCNVector3) {
        left = left + right
    }
    
    static func += (left: inout SCNVector3, right: Float) {
        left = left + right
    }
    
    static func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x - right.x, left.y - right.y, left.z - right.z)
    }
    
    static func - (left: SCNVector3, right: Float) -> SCNVector3 {
        return SCNVector3(left.x - right, left.y - right, left.z - right)
    }
    
    static func -= (left: inout SCNVector3, right: SCNVector3) {
        left = left - right
    }
    
    static func -= (left: inout SCNVector3, right: Float) {
        left = left - right
    }
    
    static func * (left: SCNVector3, right: Float) -> SCNVector3 {
        return SCNVector3(left.x * right, left.y * right, left.z * right)
    }
    
    static func * (left: Float, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left * right.x, left * right.y, left * right.z)
    }
    
    static func *= (left: inout SCNVector3, right: Float) {
        left = left * right
    }
    
    static func / (left: SCNVector3, right: Float) -> SCNVector3 {
        return SCNVector3(left.x / right, left.y / right, left.z / right)
    }
    
    static func /= (left: inout SCNVector3, right: Float) {
        left = left / right
    }
}
