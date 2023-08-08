//
//  UITableView+.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/08/07.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell(cellType: UITableViewCell.Type, reuseIdentifier: String? = nil) {
        let reuseIdentifier = reuseIdentifier ?? String(describing: cellType.self)
        self.register(cellType, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(reuseIdentifier: String? = nil, indexPath: IndexPath) -> T {
        let reuseIdentifier = reuseIdentifier ?? String(describing: T.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
    
    func registerHeaderFooterView(viewType: UIView.Type, reuseIdentifier: String? = nil) {
        let reuseIdentifier = reuseIdentifier ?? String(describing: viewType.self)
        self.register(viewType, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueHeaderFooterView<T: UIView>(reuseIdentifier: String? = nil) -> T {
        let reuseIdentifier = reuseIdentifier ?? String(describing: T.self)
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
            fatalError()
        }
        return view
    }

    func sectionCornerRadius(willDisplay cell: UITableViewCell, indexPath: IndexPath, backgroundColor: UIColor = UIColor.black) {
        
        cell.backgroundColor = UIColor.clear
        
        let cornerRadius: CGFloat = 8
        let layer = CAShapeLayer()
        let pathRef = CGMutablePath()
        let bounds = cell.bounds.insetBy(dx: 0, dy: 0)
        let addLine: Bool
        let lastRowIndex = self.numberOfRows(inSection: indexPath.section)-1
        
        layer.fillColor = backgroundColor.cgColor
        
        switch indexPath.row {
        case 0 where indexPath.row == lastRowIndex:
            pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
            addLine = false
        case 0:
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY),
                           tangent2End: CGPoint(x: bounds.midX, y: bounds.midY), radius: cornerRadius)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY),
                           tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY) )
            addLine = true
        
        case lastRowIndex:
            pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.minY), transform: CGAffineTransform())
            pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY),
                           tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
            pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY),
                           tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
            pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY) )
            addLine = false
            
        default:
            pathRef.addRect(bounds)
            addLine = true
        }
        
        layer.path = pathRef
        
        if addLine {
            let lineLayer: CALayer = CALayer()
            let lineHeight: CGFloat = (1.0 / UIScreen.main.scale)
            lineLayer.frame = CGRect(x: bounds.minX + 16,
                                     y: bounds.size.height - lineHeight,
                                     width: bounds.size.width - 32,
                                     height: lineHeight)
            lineLayer.backgroundColor = self.separatorColor?.cgColor
            layer.addSublayer(lineLayer)
        }
        
        let testView: UIView = UIView(frame: bounds)
        testView.layer.insertSublayer(layer, at: 0)
        testView.backgroundColor = UIColor.clear
        cell.backgroundView = testView
    }
}

