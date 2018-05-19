//
//  ViewController.swift
//  test
//
//  Created by 薛永伟 on 2018/5/19.
//  Copyright © 2018年 XYW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testSimple()
        
        //testScrollView()
        
    }
    
    func testScrollView(){
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .gray
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        
        let bgColor = [UIColor.red,UIColor.green,UIColor.yellow]
        
        var leftView:UIView? = nil
        for i in 0..<3{
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = bgColor[i]
            scrollView.addSubview(view)
            if let left = leftView{
                view.leftAnchor.constraint(equalTo: left.rightAnchor, constant: 0).isActive = true
            }else{
                view.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
            }
            view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
            view.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0).isActive = true
            view.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.0).isActive = true
            leftView = view
        }
        //所有的view都是上左右约束到scrollView，且宽高与scrollView相同，但是scrollView右侧还没有被关联约束
        //添加右侧的约束
        if let left = leftView{
            left.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        }
    }
    func testSimple(){
        //创建一个红色的view添加到界面上
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        //添加距离顶部20
        let topConstraint = NSLayoutConstraint.init(item: redView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20)
        topConstraint.isActive = true
        //添加距离左边20
        let leftConstraint = NSLayoutConstraint.init(item: redView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 20)
        leftConstraint.isActive = true
        //添加宽为200
        let widthConstraint = NSLayoutConstraint.init(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        widthConstraint.isActive = true
        //添加高为100
        let heightConstraint = NSLayoutConstraint.init(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        heightConstraint.isActive = true
        
        //创建一个绿色的view
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        //添加约束
        greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        greenView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueView)
        //用VFL添加约束
        let hVfl = "H:|-left-[blueView(100)]"
        let vVfl = "V:|-top-[blueView(200)]"
        let metrics = ["top":20,"left":250]
        let views = ["blueView":blueView]
        
        let ops = NSLayoutFormatOptions.alignAllLeft
        let hConsts = NSLayoutConstraint.constraints(withVisualFormat: hVfl, options: ops, metrics: metrics, views: views)
        let vConsts = NSLayoutConstraint.constraints(withVisualFormat: vVfl, options: ops, metrics: metrics, views: views)
        view.addConstraints(hConsts)
        view.addConstraints(vConsts)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

