//
//  ViewController.swift
//  StormViewer
//
//  Created by Pedro Eusébio on 11/05/2019.
//  Copyright © 2019 Pedro Eusébio. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let pictures: [String] = {
        var pics = [String]()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pics.append(item)
            }
        }
        
        return pics
    }()
    
    let pictureCellId = "pictureCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: pictureCellId)
        
        navigationItem.title = "StormViewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: pictureCellId, for: indexPath)
        cell.textLabel?.text = pictures[indexPath.item]
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.selectedImage = pictures[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

