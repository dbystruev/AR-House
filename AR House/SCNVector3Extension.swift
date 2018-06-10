//
//  SCNVector3Extension.swift
//
//  Created by Denis Bystruev on 03/06/2018.
//  Last edit by Denis Bystruev on 10/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
import SceneKit

extension SCNVector3 {
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    
    static func +<T: BinaryFloatingPoint> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x + Float(right), left.y + Float(right), left.z + Float(right))
    }
    
    static func +<T: BinaryInteger> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x + Float(right), left.y + Float(right), left.z + Float(right))
    }
    
    
    static func +<T: BinaryFloatingPoint> (left: T, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(Float(left) + right.x, Float(left) + right.y, Float(left) + right.z)
    }
    
    static func +<T: BinaryInteger> (left: T, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(Float(left) + right.x, Float(left) + right.y, Float(left) + right.z)
    }
    
    static func += (left: inout SCNVector3, right: SCNVector3) {
        left = left + right
    }
    
    static func +=<T: BinaryFloatingPoint> (left: inout SCNVector3, right: T) {
        left = left + right
    }
    
    static func +=<T: BinaryInteger> (left: inout SCNVector3, right: T) {
        left = left + right
    }
    
    static func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x - right.x, left.y - right.y, left.z - right.z)
    }
    
    static func -<T: BinaryFloatingPoint> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x - Float(right), left.y - Float(right), left.z - Float(right))
    }
    
    static func -<T: BinaryInteger> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x - Float(right), left.y - Float(right), left.z - Float(right))
    }
    
    static func -= (left: inout SCNVector3, right: SCNVector3) {
        left = left - right
    }
    
    static func -=<T: BinaryFloatingPoint> (left: inout SCNVector3, right: T) {
        left = left - right
    }
    
    static func -=<T: BinaryInteger> (left: inout SCNVector3, right: T) {
        left = left - right
    }
    
    static func *<T: BinaryFloatingPoint> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x * Float(right), left.y * Float(right), left.z * Float(right))
    }
    
    static func *<T: BinaryInteger> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x * Float(right), left.y * Float(right), left.z * Float(right))
    }
    
    static func *<T: BinaryFloatingPoint> (left: T, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(Float(left) * right.x, Float(left) * right.y, Float(left) * right.z)
    }
    
    static func *<T: BinaryInteger> (left: T, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(Float(left) * right.x, Float(left) * right.y, Float(left) * right.z)
    }
    
    static func *=<T: BinaryFloatingPoint> (left: inout SCNVector3, right: T) {
        left = left * right
    }
    
    static func *=<T: BinaryInteger> (left: inout SCNVector3, right: T) {
        left = left * right
    }
    
    static func /<T: BinaryFloatingPoint> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x / Float(right), left.y / Float(right), left.z / Float(right))
    }
    
    static func /<T: BinaryInteger> (left: SCNVector3, right: T) -> SCNVector3 {
        return SCNVector3(left.x / Float(right), left.y / Float(right), left.z / Float(right))
    }
    
    static func /=<T: BinaryFloatingPoint> (left: inout SCNVector3, right: T) {
        left = left / right
    }
    
    static func /=<T: BinaryInteger> (left: inout SCNVector3, right: T) {
        left = left / right
    }
}
