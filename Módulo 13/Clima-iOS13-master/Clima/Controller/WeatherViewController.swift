//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Envia informações do campo searchTextField para o UITextFieldDelegate
        searchTextField.delegate = self
    }
    @IBAction func searchPressed(_ sender: UIButton) {
        
    }
    //Retorna o que foi digitado no campo searchTextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Descarta o teclado após clicar em Enter
        searchTextField.endEditing(true)
        return true
    }
    //Valida o que o usuário digitou no searchTextField
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{//lembrete de digitar algo antes de descartar o teclado
            textField.placeholder = "Type something"
            return false
        }
    }
    //Limpa o campo serachTextField após apertar Enter
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fethWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

