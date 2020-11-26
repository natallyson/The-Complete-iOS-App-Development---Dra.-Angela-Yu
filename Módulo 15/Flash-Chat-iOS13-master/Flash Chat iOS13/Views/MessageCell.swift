//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Natallyson Saraiva on 26/11/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit
//Usada como UITableView, que será exibida na visualizaçao da tabela do ChatViewController
class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //definindo o tamanho do balão e as bordas borbulhantes
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
