//
//  ViewController.swift
//  NewsApp
//
//  Created by Mac on 01/05/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     //array for json
    var arrList = [NewsFeed]()
    
    @IBOutlet weak var tabelview: UITableView!
    @IBAction func refreshBT(_ sender: Any) {
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        arrList.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrList[section].articles!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let t = arrList[indexPath.section].articles![indexPath.row].urlToImage
        let imageurl = URL(string: t!)
        let cell = tabelview.dequeueReusableCell(withIdentifier: "cell")as! FeedTableViewCell
        cell.lblone.text = arrList[indexPath.section].articles![indexPath.row].title
        cell.lbltwo.text = arrList[indexPath.section].articles![indexPath.row].description
        cell.Img.sd_setHighlightedImage(with: imageurl, options: .highPriority, context: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlLink = arrList[indexPath.section].articles![indexPath.row].url
        let vc = self.storyboard?.instantiateViewController(identifier: "WebViewController") as! WebViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.urlLink = urlLink                                                                   //vc.urlLink is the string variabel declear in vc
        
    }
    
    func update (){
        //API key
        let urlstring = ""
        let url = URL(string: urlstring)
        
        guard  url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil{
                // parse Json
                let decoder = JSONDecoder()
                
                do{
                    let newsfeed = try decoder.decode(NewsFeed.self, from: data!)  //NewsFeed is the model
                    self.arrList.append(newsfeed)                                  //aadding json data into array
                    
                    DispatchQueue.main.async {                                     //It is an object that manages the execution of tasks serially
                        self.tabelview.reloadData()                                 //reload tabelView
                    }
                    
                }
                catch{
                    print("error in json")
                }
            } else{
                print(error!.localizedDescription)
            }
        }
        // make API call
        dataTask.resume()
    }
    
}

