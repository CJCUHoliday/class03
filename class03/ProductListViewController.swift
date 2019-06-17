//
//  ProductListViewController.swift
//  class03
//
//  Created by L20102 on 2019/6/17.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell : UITableViewCell = UITableViewCell(style: .default,reuseIdentifier: "a")
        let cell: MyTableViewCell =  tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) as! MyTableViewCell
         let title: String=self.array[indexPath.row]
        cell.updateContent(content: title)
      //  cell.updateConstraints()
      //  cell.textLabel?.text=self.array[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectContent = array[indexPath.row]
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "MoveToDetailSegue", sender: self)
        }
    }
    
    var selectContent : String?
    
    var array:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        array=["a","huhiu huihi hui hui  bbjk njknjk vgvh ml;mkl vghv ctcdt mklml gvy ml bvhj cft kljkl nmk vghu","chuhiu huihi hui hui  bbjk njknjk vgvh ml;mkl vghv ctcdt mklml gvy ml bvhj cft kljkl nmk vghu huhiu huihi hui hui  bbjk njknjk vgvh ml;mkl vghv ctcdt mklml gvy ml bvhj cft kljkl nmk vghu huhiu huihi hui hui  bbjk njknjk vgvh ml;mkl vghv ctcdt mklml gvy ml bvhj cft kljkl nmk vghu"]
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="MoveToDetailSegue")
        {
            let destination=segue.destination as! DetailViewController
            destination.content=self.selectContent
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 

}
