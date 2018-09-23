//
//  QuizzTableVC.swift
//  xmen-quizz
//
//  Created by Kevin Amiranoff on 16/09/2018.
//  Copyright © 2018 Nemean Tale Studios. All rights reserved.
//

import UIKit

class QuizzTableVC: UITableViewController {

    var image: UIImage?
    let quizzes = QuizzService.instance.getQuizzes()

    @IBOutlet weak var quizzTable: UITableView!

    private let tableHeaderViewHeight: CGFloat = 300.0
    private let tableHeaderViewCutaway: CGFloat = 0.0
    
    var headerView: QuizzTableHeader!
    var headerMaskLayer: CAShapeLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        quizzTable.delegate = self
        quizzTable.allowsSelection = true
        makeStretchyHeader()
    }
    
    
    func makeStretchyHeader() {
        quizzTable.separatorColor = UIColor.clear
        quizzTable.estimatedRowHeight = tableHeaderViewHeight
        quizzTable.rowHeight = UITableView.automaticDimension
        
        headerView = quizzTable.tableHeaderView as? QuizzTableHeader
        image = UIImage(named: "x-men-logo-quizz-whitespace.png")
        headerView.imageView.image = image
        quizzTable.tableHeaderView = nil
        
        quizzTable.addSubview(headerView)
        quizzTable.contentInset = UIEdgeInsets(top: tableHeaderViewHeight, left:0,bottom:0, right:0)
        
        let navbarHeight: CGFloat = 64.0
        quizzTable.contentOffset = CGPoint(x: 0, y: -tableHeaderViewHeight + navbarHeight)
        
        // cut away the header view
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        
        let effectiveHeight = tableHeaderViewHeight - (tableHeaderViewCutaway / 2)
        quizzTable.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        quizzTable.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        updateHeaderView()
    }
    
    func updateHeaderView() {
        let effectiveHeight = tableHeaderViewHeight - (tableHeaderViewCutaway / 2)

        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: quizzTable.bounds.width, height: tableHeaderViewHeight)
        
   //     if(quizzTable.contentOffset.y < -effectiveHeight) {
            headerRect.origin.y = quizzTable.contentOffset.y
            headerRect.size.height = -quizzTable.contentOffset.y + (tableHeaderViewCutaway / 2)
    //    }
        
        headerView.frame = headerRect
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0,y: headerRect.height - tableHeaderViewCutaway))
        headerMaskLayer?.path = path.cgPath
    }
    
    
}

extension QuizzTableVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizzService.instance.getQuizzes().count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuizzCell") as? QuizzCell {
            let quizz = QuizzService.instance.getQuizzes()[indexPath.row]
            cell.selectionStyle = .none
            cell.updateViews(quizz: quizz)
            
            return cell
        }
        
        return QuizzCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quizz = QuizzService.instance.getQuizzes()[indexPath.row]
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            self.parent?.performSegue(withIdentifier: "QuizzSegue", sender: quizz)
        }
    }
}

extension QuizzTableVC {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}
