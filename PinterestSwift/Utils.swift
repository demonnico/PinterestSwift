//
//  Easy-Cal.swift
//  tableview
//
//  Created by 王 巍 (@onevcat) on 14-6-4.
//  Copyright (c) 2014年 OneV's Den. All rights reserved.
//

import Foundation

@infix func +(lhs: Int, rhs: Double) -> Double {
    return Double(lhs) + rhs
}

@infix func +(lhs: Double, rhs: Int) -> Double {
    return lhs + Double(rhs)
}

@infix func +(lhs: Int, rhs: Float) -> Float {
    return Float(lhs) + rhs
}

@infix func +(lhs: Float, rhs: Int) -> Float {
    return lhs + Float(rhs)
}

@infix func +(lhs: Float, rhs: Double) -> Double {
    return Double(lhs) + rhs
}

@infix func +(lhs: Double, rhs: Float) -> Double {
    return lhs + Double(rhs)
}

@infix func +(lhs: UInt, rhs: Double) -> Double {
    return Double(lhs) + rhs
}

@infix func +(lhs: Double, rhs: UInt) -> Double {
    return lhs + Double(rhs)
}

@infix func +(lhs: UInt, rhs: Float) -> Float {
    return Float(lhs) + rhs
}

@infix func +(lhs: Float, rhs: UInt) -> Float {
    return lhs + Float(rhs)
}

@infix func -(lhs: Int, rhs: Double) -> Double {
    return Double(lhs) - rhs
}

@infix func -(lhs: Double, rhs: Int) -> Double {
    return lhs - Double(rhs)
}

@infix func -(lhs: Int, rhs: Float) -> Float {
    return Float(lhs) - rhs
}

@infix func -(lhs: Float, rhs: Int) -> Float {
    return lhs - Float(rhs)
}

@infix func -(lhs: Float, rhs: Double) -> Double {
    return Double(lhs) - rhs
}

@infix func -(lhs: Double, rhs: Float) -> Double {
    return lhs - Double(rhs)
}

@infix func -(lhs: UInt, rhs: Double) -> Double {
    return Double(lhs) - rhs
}

@infix func -(lhs: Double, rhs: UInt) -> Double {
    return lhs - Double(rhs)
}

@infix func -(lhs: UInt, rhs: Float) -> Float {
    return Float(lhs) - rhs
}

@infix func -(lhs: Float, rhs: UInt) -> Float {
    return lhs - Float(rhs)
}

@infix func *(lhs: Int, rhs: Double) -> Double {
    return Double(lhs) * rhs
}

@infix func *(lhs: Double, rhs: Int) -> Double {
    return lhs * Double(rhs)
}

@infix func *(lhs: Int, rhs: Float) -> Float {
    return Float(lhs) * rhs
}

@infix func *(lhs: Float, rhs: Int) -> Float {
    return lhs * Float(rhs)
}

@infix func *(lhs: Float, rhs: Double) -> Double {
    return Double(lhs) * rhs
}

@infix func *(lhs: Double, rhs: Float) -> Double {
    return lhs * Double(rhs)
}

@infix func *(lhs: UInt, rhs: Double) -> Double {
    return Double(lhs) * rhs
}

@infix func *(lhs: Double, rhs: UInt) -> Double {
    return lhs * Double(rhs)
}

@infix func *(lhs: UInt, rhs: Float) -> Float {
    return Float(lhs) * rhs
}

@infix func *(lhs: Float, rhs: UInt) -> Float {
    return lhs * Float(rhs)
}

@infix func /(lhs: Int, rhs: Double) -> Double {
    return Double(lhs) / rhs
}

@infix func /(lhs: Double, rhs: Int) -> Double {
    return lhs / Double(rhs)
}

@infix func /(lhs: Int, rhs: Float) -> Float {
    return Float(lhs) / rhs
}

@infix func /(lhs: Float, rhs: Int) -> Float {
    return lhs / Float(rhs)
}

@infix func /(lhs: Float, rhs: Double) -> Double {
    return Double(lhs) / rhs
}

@infix func /(lhs: Double, rhs: Float) -> Double {
    return lhs / Double(rhs)
}

@infix func /(lhs: UInt, rhs: Double) -> Double {
    return Double(lhs) / rhs
}

@infix func /(lhs: Double, rhs: UInt) -> Double {
    return lhs / Double(rhs)
}

@infix func /(lhs: UInt, rhs: Float) -> Float {
    return Float(lhs) / rhs
}

@infix func /(lhs: Float, rhs: UInt) -> Float {
    return lhs / Float(rhs)
}