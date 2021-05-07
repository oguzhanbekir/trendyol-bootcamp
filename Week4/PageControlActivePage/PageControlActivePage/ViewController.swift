//
//  ViewController.swift
//  PageControlActivePage
//
//  Created by Oguzhan Bekir on 7.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        pages.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        pages.append(vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        pages.append(vc3)

        pageControl.frame = CGRect(x: 50, y: 10, width: 300, height: 100)
        pageControl.numberOfPages = pages.count;
        pageControl.currentPage = 0;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.pageVC()
    }

    func pageVC() {
        guard let first = pages.first else { return }
        
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.dataSource = self
        vc.delegate = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        vc.view.addSubview(pageControl)
        present(vc, animated: true, completion: nil)
    }
    
}

extension ViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil}
        
        let prev = index - 1
        return pages[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = pages.firstIndex(of: viewController), index < (pages.count - 1) else { return nil}
        
        let next = index + 1
        return pages[next]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
    
}
