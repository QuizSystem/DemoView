//
//  DemoViewController.swift
//  DemoView
//
//  Created by Nguyen Van Thieu B on 11/7/16.
//  Copyright © 2016 Thieu Mao. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pading:CGFloat = 1;
        let leftMarginHour:CGFloat = 5
        let widthHour:CGFloat = 50
        let widthRest:CGFloat = self.view.frame.width - widthHour - leftMarginHour
        
        //  draw Hour
        var d1hourBegin:CGFloat = 0;
        var d1hourEnd:CGFloat = 0;
        for index in 0...24 {
            let y : CGFloat = CGFloat(index * 100)
            var text = String(index)
            if (index < 10) {
                text = "0" + text
            }
            text = text + ":00"
            drawText(text: text, x: leftMarginHour, y: y, width: widthHour, height: 50)
            if (index == 0) {
                d1hourBegin = y;
            }
            if (index == 1) {
                d1hourEnd = y;
            }
        }
        var d1hour:CGFloat = d1hourEnd - d1hourBegin;
        
        // draw Event
        var a:[CGFloat] = [1, 3, 4, 11, 14, 15]
        var b:[CGFloat] = [4, 5, 10, 13, 17, 18]
        var n:Int = 6

        var pairs:[(position: Int, count: Int)] = []
        var count:Int = 1
        for i in 0...n-2 {
            print("i= ", i)
            if (a[i]<a[i+1] && a[i+1]<b[i]) {
                count += 1
                if (i == n-2) {
                    pairs += [(position: i+1, count: count)]
                    print("---- i=", i+1, " count=", count)
                }
            } else {
                // save i, count
                pairs += [(position: i, count: count)]
                print("---- i=", i, " count=", count)
                count = 1
                if (i == n-2) {
                    pairs += [(position: i+1, count: count)]
                    print("---- i=", i+1, " count=", count)
                }
            }
        }
        
        for pair in pairs {
            var positionFrom:Int = pair.position - pair.count + 1
            var positionTo:Int = pair.position
            var count:Int = pair.count
            print("from:", positionFrom, " to:", positionTo, " count:", count)
            var dem:Int = 0
            for i in positionFrom...positionTo {
                print(i)
                let width:CGFloat = widthRest / CGFloat(count);
                let height:CGFloat = (b[i] - a[i]) * d1hour;
                let x:CGFloat = 60 + CGFloat(dem) * width
                let y:CGFloat = a[i] * d1hour
                drawEvent(x: x, y: y, width: width, height: height)
                dem += 1
            }
        }
        
        /*
        for i in 0...n-1 {
            for j in 0...n-1 {
                if (a[i] < a[j] && a[j] < b[i]) || (a[i] < b[j] && b[j] < b[i]) {
                    c[i] = c[i] + 1
                }
            }
        }
        
        for i in 0...n-1 {
            // a[i] = Gio bat dau, b[i] = Gio ket thuc, c[i] = so lan
            // d1hour = khoang cach 1 gio
            // widthRest = chieu rong cao lai
            let x:CGFloat = 60;
            let y:CGFloat = a[i] * d1hour;
            //print(c[i])
            let width:CGFloat = widthRest / CGFloat(c[i]);
            let height:CGFloat = (b[i] - a[i]) * d1hour;
            drawEvent(x: x, y: y, width: width, height: height)
        }
 */
        
        // draw Event
        //drawEvent(x: 60, y: 10, width: widthRest/2, height: 200)
        //drawEvent(x: 60+widthRest/2+pading, y: 10, width: widthRest/2, height: 200)
        //drawEvent(x: 60, y: 300, width: widthRest, height: 200)
        //drawEvent(x: 60, y: 700, width: widthRest, height: 200)
        
        
        // add contentSize for ScrollView
        var contentRect = CGRect.zero
        for view: UIView in self.myScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.myScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: contentRect.height)
    }
    
    func drawText(text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let label:UILabel = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        label.text = text
        myScrollView.addSubview(label)
    }
    
    func drawEvent(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let myView:UIView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        myView.backgroundColor = UIColor.orange
        myView.layer.borderWidth = 1.0
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        label.text = "Mao"
        label.textColor = UIColor.white
        label.textAlignment = .center
        myView.addSubview(label)
        myScrollView.addSubview(myView)
    }
    
}
