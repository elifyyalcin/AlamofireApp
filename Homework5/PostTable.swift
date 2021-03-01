//
//  PostTable.swift
//  Homework5
//
//  Created by Elif Yalçın on 29.01.2021.
//

import UIKit
import Alamofire

class PostTable: UITableViewController {
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var post: PostData? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        AF.request(url).response{
            (res) in if(res.response?.statusCode == 200){
                self.post = try? JSONDecoder().decode(PostData.self, from: res.data!)
                self.tableView.reloadData()
                self.loading.stopAnimating()
                self.loading.alpha = 0.0
                self.loading.frame = CGRect(x:0, y:0, width: 0, height: 0)
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return post!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = post![indexPath.row]
        cell.textLabel?.text = item.title

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = post![indexPath.row] //Seçili nesneyi gönderiyoruz.
        performSegue(withIdentifier: "detail", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "detail" ) {
            let vc = segue.destination as! Detail
            vc.post = (sender as? PostDatum)!
        }
    }
    


}
