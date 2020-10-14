//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // Dispensa o teclado quando o usuário escolhe um dos valores de ponta.
        billTextField.endEditing(true)
       
        //Desmarque todos os botões de dica via IBOutlets.
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
       
        //Faça com que o botão que acionou a IBAction seja selecionado.
        sender.isSelected = true
        
        //Pega o título atual do botão que foi pressionado.
        let buttonTitle = sender.currentTitle!
        
        //Remova o último caractere (%) do título e transforme-o novamente em uma String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Transforme a String em um Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divida a porcentagem expressa de 100 em um decimal, por exemplo 10 torna-se 0,1
        tip = buttonTitleAsANumber / 100

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
       
        //Obtenha o valor do passo usando sender.value, arredonde-o para um número inteiro e defina-o como o String em splitNumberLabel
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    
        // Defina a propriedade numberOfPeople como o valor do stepper como um número inteiro.
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Pega o texto que o usuário digitou no billTextField
        let bill = billTextField.text!
        
        // Se o texto não for uma String vazia ""
        if bill != "" {
        // Transforme a nota de uma String, por exemplo "123,50" para uma string real com casas decimais.
            billTotal = Double(bill)!
            
            // Multiplique a conta pela porcentagem da gorjeta e divida pelo número de pessoas para dividir a conta.
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            // Arredonde o resultado para 2 casas decimais e transforme-o em uma String.
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            print(resultTo2DecimalPlaces)
        }
    }
}
