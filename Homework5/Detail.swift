//
//  Detail.swift
//  Homework5
//
//  Created by Elif Yalçın on 29.01.2021.
//

import UIKit

class Detail: UIViewController {
    
    var post: PostDatum!

    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTitle.text = post.title
        txtDetail.text = post.body

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
