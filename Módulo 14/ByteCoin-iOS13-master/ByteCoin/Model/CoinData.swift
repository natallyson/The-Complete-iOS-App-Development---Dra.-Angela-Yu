//
//  CoinData.swift
//  ByteCoin
//
//  Created by Natallyson Saraiva on 11/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

//Struct para decodificar o JSON.
//Transformar um objeto Swift em JSON.
struct CoinData: Decodable {
    
    //Damos a ele um tipo de dado Double, ao preço do bitcoin.
    let rate: Double
}
