//
//  main.swift
//  ClassesDemo
//
//  Created by Natallyson Saraiva on 09/10/20.
//

import Foundation

let skeleton = Enemy()

let dragon = Dragon()

dragon.wingSpan = 5
dragon.attackStrength = 15
dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are a hurricane")
dragon.move()
dragon.attack()

