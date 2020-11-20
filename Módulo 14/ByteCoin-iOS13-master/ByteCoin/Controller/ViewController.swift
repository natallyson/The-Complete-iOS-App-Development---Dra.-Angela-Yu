//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
//A classe ViewController é capaz de fornecer dados para qualquer UIPickerViews.
//Add protocols
class ViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    //Mudar de let para var para modificar as propriedades
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adicionando o delegate para receber os métodos chamados.
        coinManager.delegate = self
        //Adicionando set a Classe ViewController. A fonte de dados para o objeto currencyPicker.
        currencyPicker.dataSource = self
        //Definindo a classe ViewController como delegate de currencyPicker
        currencyPicker.delegate = self
    }
}
    //Métodos para os delegates
    
    //MARK: - CoinManagerDelegate
    
    extension ViewController: CoinManagerDelegate {
        
        //Quando recebe o valor do bitcoin, ele chama esse método e passa o seu valor e a moeda.
        func didUpdatePrice(price: String, currency: String) {
            //thread principal para atualizar a IU em segundo plano.
            DispatchQueue.main.async {
                self.bitcoinLabel.text = price
                self.currencyLabel.text = currency
            }
        }
        
        func didFailWithError(error: Error) {
            print(error)
        }
    }
    
    //MARK: - UIPickerView DataSource & Delegate
    
    extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        
        //Determinando No. de colunas no seletor
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        //Metodo para contar o número de linhas no seletor do currencyArray no CoinManager
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return coinManager.currencyArray.count
        }
        
        //Adicionando o método delegate ao pickerView.
        //Quando o PickerView estiver carregando, ele pedirá a seu delegate um título de linha e chamará o método abaixo uma vez para cada linha.
        //Quando ele está tentando obter o título para a primeira linha, ele passará um valor de linha de 0 e um valor de componente (coluna) de 0.
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return coinManager.currencyArray[row]
        }
        
        //Sempre que o usuário rolar o seletor, chamará este metodo.
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            //Envia ao CoinManager a moeda selecionada
            let selectedCurrency = coinManager.currencyArray[row]
            coinManager.getCoinPrice(for: selectedCurrency)
        }
    }
