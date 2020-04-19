//
//  ViewController.swift
//  TorpolRukit Jabodetabek
//
//  Created by Miky Setiawan on 19/04/20.
//  Copyright © 2020 Miky Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rumahSakitTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Menambahkan title pada Navigation
        self.navigationItem.title = "List RS Jabodetabek"
        
        // Menghubungkan rumahSakitTableView dengan ke dua metode di bawah
        rumahSakitTableView.dataSource = self
                
        // Menambahkan delegate ke table view
        rumahSakitTableView.delegate = self
            
        // Menghubungkan berkas XIB untuk TableViewCell dengan rumahSakitTableView.
        rumahSakitTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Digunakan untuh menghubungkan cell dengan identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
            
        // Menetapkan nilai hero ke view di dalam cell
        let list = listRS[indexPath.row]
        cell.titleList.text = list.title
        cell.descList.text = list.address
        cell.photoList.image = list.photo
            
        // Kode ini digunakan untuk membuat imageView memiliki frame bound/lingkaran
        cell.photoList.layer.cornerRadius = cell.photoList.frame.height / 2
        cell.photoList.clipsToBounds = true
        return cell
    }
}

extension ViewController: UITableViewDelegate{
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Memanggil View Controller dengan berkas NIB/XIB di dalamnya
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        // Mengirim data
        detail.tableAdapter = listRS[indexPath.row]
        
        // Push/mendorong view controller lain
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

