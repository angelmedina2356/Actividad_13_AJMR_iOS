//
//  NoticiasVC.swift
//  VideoNoticia
//
//  Created by alicharlie on 12/05/16.
//  Copyright © 2016 codepix. All rights reserved.
//
// ANGEL JOSUE MEDINA RIVAS
import UIKit


class NoticiasVC: UITableViewController {
//TAREAS
    var noticias:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //TAREAS
        LeerNoticias().getNoticias { (datos) in
            self.noticias = datos
            self.tableView.reloadData()
        }
        
        let inset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0);
        self.tableView.contentInset = inset
        self.tableView.scrollIndicatorInsets = inset
    
        LeerNoticias().getNoticias { (datos) in
            self.noticias = datos
        }
        
        
    }
    
    //TAREAS
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noticias.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //TAREA
        celda.textLabel!.text = self.noticias[indexPath.row]
        
        return celda
        
    }
    
    
}
