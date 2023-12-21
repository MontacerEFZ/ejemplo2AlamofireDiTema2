//
//  ViewController.swift
//  ejemplo2AlamofireDiTema2
//
//  Created by Montacer El Fazazi on 21/12/2023.
//

import UIKit
import Alamofire
import Toast
import AlamofireImage

class ViewController: UIViewController, UITextViewDelegate, UITableViewDataSource {

    let BASE_URL = "https://rickandmortyapi.com/api/character"
    var personajes:[Personaje]=[]

    @IBOutlet weak var tablaPersonajes: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descargarDatos()

    }
    
    func descargarDatos(){
        let jsonDecoder = JSONDecoder()
        AF.request(BASE_URL).responseDecodable(of: Respuesta.self, decoder: jsonDecoder){
            respuesta in guard let res = respuesta.value
            else{
                self.view.makeToast("ERROR AL DESCARGAR")
                return
            }
        self.personajes = res.results
        self.tablaPersonajes.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personajes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDA", for: indexPath) as! CeldaTableViewCell
        
        celda.lbTitulo.text = personajes[indexPath.row].name
        celda.lbGeenro.text = personajes[indexPath.row].gender
        
        AF.request(personajes[indexPath.row].image).responseImage{
            imagen in
            if case.success(let img) = imagen.result{
                celda.imgFoto.image = img
            }
        }
        
        return celda;
    }


}

