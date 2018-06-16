//
//  SCNVector3Extension.swift
//
//  Created by Denis Bystruev on 03/06/2018.
//  Last edit by Denis Bystruev on 11/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
import SceneKit

extension SCNVector3 {
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    
    static func +<T: NSNumber> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x + Float(truncating: right), left.y + Float(truncating: right), left.z + Float(truncating: right))
    }
    
    static func +<T: NSNumber> (left: T, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(Float(truncating: left) + right.x, Float(truncating: left) + right.y, Float(truncating: left) + right.z)
    }
    
    static func += (left: inout SCNVector3, right: SCNVector3) {
        left = left + right
    }
    
    static func +=<T: NSNumber> (left: inout SCNVector3, right: T) {
        left = left + right
    }
    
    static func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x - right.x, left.y - right.y, left.z - right.z)
    }
    
    static func -<T: NSNumber> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x - Float(truncating: right), left.y - Float(truncating: right), left.z - Float(truncating: right))
    }
    
    static func -= (left: inout SCNVector3, right: SCNVector3) {
        left = left - right
    }
    
    static func -=<T: NSNumber> (left: inout SCNVector3, right: T) {
        left = left - right
    }
    
    static func *<T: NSNumber> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x * Float(truncating: right), left.y * Float(truncating: right), left.z * Float(truncating: right))
    }
    
    static func *<T: NSNumber> (left: T, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(Float(truncating: left) * right.x, Float(truncating: left) * right.y, Float(truncating: left) * right.z)
    }
    
    static func *=<T: NSNumber> (left: inout SCNVector3, right: T) {
        left = left * right
    }
    
    static func /<T: NSNumber> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x / Float(truncating: right), left.y / Float(truncating: right), left.z / Float(truncating: right))
    }
    
    static func /=<T: NSNumber> (left: inout SCNVector3, right: T) {
        left = left / right
    }
}
