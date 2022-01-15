//
//  SepetVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 14.01.2022.
//

import UIKit

class SepetVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var sepetList = [Sepet]()
    var sepetPresenterNesnesi: ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sepet"
        tableView.delegate = self
        tableView.dataSource = self
        SepetRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetYukle()
    }
}

extension SepetVC: PresenterToViewSepetProtocol{
    func vieweVeriGonder(sepetList: Array<Sepet>) {
        self.sepetList = sepetList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension SepetVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sepet = sepetList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListeTableCell", for: indexPath) as! ListeTableCell
        cell.setup(sepet: sepet)
        return cell
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = sepetList[indexPath.row] 
       
        let alert = UIAlertController(title: "Silme İşlemi", message: "\(urun.yemek_adi!) silinsin mi ?", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in}
        alert.addAction(iptalAction)
        
        let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
            self.sepetPresenterNesnesi?.sil(sepet: urun)
        }
        alert.addAction(evetAction)
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let urun = self.sepetList[indexPath.row]
           
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(urun.yemek_adi!) silinsin mi ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in}
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepetPresenterNesnesi?.sil(sepet: urun)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
