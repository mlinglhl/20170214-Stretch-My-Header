//
//  NewsViewController.swift
//  20170214 Stretch My Header
//
//  Created by Minhung Ling on 2017-02-14.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

import UIKit
struct NewsItem {
    let category:String
    let headline:String
    init(category:String, headline:String) {
        self.category = category
        self.headline = headline
    }
}

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    var headerView: UIView!
    
    let categoryArray:Array<String> = [
        "World",
        "Europe",
        "Middle East",
        "Africa",
        "Asia Pacific",
        "Americas"
    ]
    
    var newsArray:Array<NewsItem> = []
    
    override func viewDidLoad() {
        headerView = newsTableView.tableHeaderView
        newsTableView.tableHeaderView = nil
        newsTableView.addSubview(headerView)
        
        let baseTableViewHeight = CGFloat(300)
        newsTableView.contentInset = UIEdgeInsetsMake(baseTableViewHeight, 0, 0, 0)
        updateHeaderView()
        let todayDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        dateLabel.text = formatter.string(from: todayDate)
        super.viewDidLoad()
        let news1 = NewsItem(category: categoryArray[0], headline: "Climate change protests, divestments meet fossil fuels realities")
        newsArray.append(news1)
        let news2 = NewsItem(category: categoryArray[1], headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime")
        newsArray.append(news2)
        let news3 = NewsItem(category: categoryArray[2], headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        newsArray.append(news3)
        let news4 = NewsItem(category: categoryArray[3], headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        newsArray.append(news4)
        let news5 = NewsItem(category: categoryArray[4], headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        newsArray.append(news5)
        let news6 = NewsItem(category: categoryArray[5], headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        newsArray.append(news6)
        let news7 = NewsItem(category: categoryArray[0], headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        newsArray.append(news7)
        let news8 = NewsItem(category: categoryArray[1], headline: "One million babies' created by EU student exchanges")
        newsArray.append(news8)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let news = newsArray[indexPath.row]
        cell.categoryLabel.text = news.category
        cell.headlineLabel.text = news.headline
        switch news.category {
        case "World":
            cell.categoryLabel.textColor = UIColor.red
            break
        case "Americas":
            cell.categoryLabel.textColor = UIColor.blue
            break
        case "Europe":
            cell.categoryLabel.textColor = UIColor.green
            break
        case "Middle East":
            cell.categoryLabel.textColor = UIColor.yellow
            break
        case "Africa":
            cell.categoryLabel.textColor = UIColor.orange
            break
        case "Asia Pacific":
            cell.categoryLabel.textColor = UIColor.purple
            break
        default:
            cell.categoryLabel.textColor = UIColor.black
            break
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -300, width: newsTableView.bounds.width, height: 300)
        if newsTableView.contentOffset.y < -300 {
            headerRect.origin.y = newsTableView.contentOffset.y
            headerRect.size.height = -newsTableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
}
