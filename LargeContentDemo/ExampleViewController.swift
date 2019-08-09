//
//  ExampleViewController.swift
//  LargeContentDemo
//
//  Created by Алексей Берёзка on 07/08/2019.
//  Copyright © 2019 Алексей Берёзка. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var customizedButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableLargeContentViewers()
        
        customizeLargeContentViewer(view: customizedButton,
                                    title: "Hello there",
                                    image: #imageLiteral(resourceName: "grievous"))
        
        updateSliderLargeContentViewerValue()
        updatePageControlLargeContentViewerValue()
    }
}

// MARK: Segue
extension ExampleViewController {
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if let helperViewController = segue.destination as? HelperViewController {
            helperViewController.view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// MARK: Enabling Large Content Viewer
extension ExampleViewController {
    private func enableLargeContentViewers() {
        let views: [UIView] = [defaultButton,
                               customizedButton,
                               textField,
                               slider,
                               pageControl,
                               imageView]
        
        for view in views {
            enableLargeContentViewer(for: view)
        }
    }
    
    private func enableLargeContentViewer(for view: UIView) {
        view.addInteraction(UILargeContentViewerInteraction())
        view.showsLargeContentViewer = true
    }
}

// MARK: Slider
extension ExampleViewController {
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateSliderLargeContentViewerValue()
    }
    
    private func updateSliderLargeContentViewerValue() {
        let newValue = Int(slider.value)
        let title = String(newValue)
        customizeLargeContentViewer(view: slider,
                                    title: title)
    }
}

// MARK: Page Control
extension ExampleViewController {
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        updatePageControlLargeContentViewerValue()
    }
    
    private func updatePageControlLargeContentViewerValue() {
        let title = "Page \(pageControl.currentPage+1) of \(pageControl.numberOfPages)"
        customizeLargeContentViewer(view: pageControl,
                                    title: title)
    }
}

// MARK: Customization
extension ExampleViewController {
    private func customizeLargeContentViewer(view: UIView,
                                             title: String? = nil,
                                             image: UIImage? = nil) {
        view.largeContentTitle = title
        view.largeContentImage = image
        
        view.scalesLargeContentImage = true
        
        let inset: CGFloat = 100
        view.largeContentImageInsets = .init(top: inset, left: inset, bottom: inset, right: inset)
    }
}
