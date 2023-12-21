//
//  CeldaTableViewCell.swift
//  ejemplo2AlamofireDiTema2
//
//  Created by Montacer El Fazazi on 21/12/2023.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbGeenro: UILabel!
    @IBOutlet weak var lbTitulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
