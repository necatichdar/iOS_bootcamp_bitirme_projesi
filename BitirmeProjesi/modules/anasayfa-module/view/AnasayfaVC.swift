//
//  AnasayfaVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 12.01.2022.
//

import UIKit
import ProgressHUD

let d = UserDefaults.standard

class AnasayfaVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var tumUrunlerCollectionView: UICollectionView!
    @IBOutlet weak var populerCollectionView: UICollectionView!
    
    var yemekListe = [Yemekler]()
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nusr-Et"
         
        populerCollectionView.delegate = self
        populerCollectionView.dataSource = self
        tumUrunlerCollectionView.delegate = self
        tumUrunlerCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    @IBAction func buttonSepet(_ sender: Any) {
        performSegue(withIdentifier: "toSepet", sender: nil)
    }
    
    
    @IBAction func exitAppButton(_ sender: Any) {
        restartApplication()
    }
    
    func restartApplication () {
        ProgressHUD.showSuccess("Oturum başarıyla kapatıldı")
        d.removeObject(forKey: "username")
         
          Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
              UIApplication.shared.windows[0].rootViewController = UIStoryboard(
                  name: "Main",
                  bundle: nil
              ).instantiateInitialViewController()
          }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVC
            gidilecekVC.yemek = yemek
        }
        if segue.identifier == "toKategori" {
            print("girdi mi ")
            let kategori = sender as? YemekKategori
            let gidilecekVC = segue.destination as! KategoriListeVC
            gidilecekVC.kategori = kategori
        }
    }
}

extension AnasayfaVC: PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemekListe = yemeklerListesi
        DispatchQueue.main.async {
            self.populerCollectionView.reloadData()
            self.tumUrunlerCollectionView.reloadData()
        }
    }
    
    
}

extension AnasayfaVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return kategoriler.count
        case populerCollectionView:
            return yemekListe.count
        case tumUrunlerCollectionView:
            return yemekListe.count
        default: return 0
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCVC
            let kategori = kategoriler[indexPath.row]
            cell.setup(category: kategori)
            return cell
        case populerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "populerCell", for: indexPath) as! PopulerCVC
            let yemek = yemekListe[indexPath.row]
            cell.setup(yemek: yemek)
            return cell
        case tumUrunlerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tumCell", for: indexPath) as! TumUrunlerCVC
            let yemek = yemekListe.reversed()[indexPath.row]
            cell.setup(yemek: yemek)
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "toDetay", sender: yemek)
        switch collectionView {
        case categoryCollectionView:
            let kategori = kategoriler[indexPath.row]
            print("kateogri");
            performSegue(withIdentifier: "toKategori", sender: kategori)
            break
        case populerCollectionView:
            print("popüler")
            let yemek = yemekListe[indexPath.row]
            performSegue(withIdentifier: "toDetay", sender: yemek)
            break
        case tumUrunlerCollectionView:
            print("tümürünler")
            let yemek = yemekListe.reversed()[indexPath.row]
            performSegue(withIdentifier: "toDetay", sender: yemek)
            break
        default: break
        }
        
//        switch collectionView {
//        case categoryCollectionView:
//            categoryCollectionView.deselectItem(at: indexPath, animated: true)
//        case populerCollectionView:
//            populerCollectionView.deselectItem(at: indexPath, animated: true)
//        case tumUrunlerCollectionView:
//            tumUrunlerCollectionView.deselectItem(at: indexPath, animated: true)
//        default:print("yok")
//        }
    }
    
}
