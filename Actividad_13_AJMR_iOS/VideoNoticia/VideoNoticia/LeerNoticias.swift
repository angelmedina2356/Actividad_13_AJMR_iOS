//
//  LeerNoticias.swift
//  VideoNoticia
//
//  Created by alicharlie on 12/05/16.
//  Copyright © 2016 codepix. All rights reserved.
//

import Foundation


class LeerNoticias{


    func getNoticias(termino: @escaping (_ datos:[String])->()){
      let liga = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/arts/30.json?api-key=029bb2ef5c76452bac5b2c3ca06893dd"
      let url = URL(string: liga)!
        URLSession.shared.dataTask(with: url) { NSData, URLResponse, NSError in
            var titulos:[String] = []
            do{
                let resultado = try JSONSerialization.jsonObject(with: NSData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
            
                for valor in resultado["results"] as! [NSDictionary]{
                  titulos.append(valor["title"] as! String)
                }
             
                DispatchQueue.main.async(execute: {() -> Void in
                termino(titulos)
             })
            }catch{
              print("Error en lectura")
            }
        }.resume()
        }
    }



