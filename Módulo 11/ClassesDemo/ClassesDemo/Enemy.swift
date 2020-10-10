//
//  Enemy.swift
//  ClassesDemo
//
//  Created by Natallyson Saraiva on 09/10/20.
//

class Enemy {
    var health = 100
    var attackStrength = 10
    
    func move() {
        print("Walk forwards.")
    }
    
    func attack(){
        print("Land a hit, does \(attackStrength) damage.")
    }
}
