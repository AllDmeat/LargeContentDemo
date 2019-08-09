//
//  HelperViewController.swift
//  LargeContentDemo
//
//  Created by Алексей Берёзка on 07/08/2019.
//  Copyright © 2019 Алексей Берёзка. All rights reserved.
//

import UIKit

class HelperViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateInfo(for: traitCollection.preferredContentSizeCategory)
    }
    
    private var titleForInfo = "Turn on accessible content size to play with demo"
    private var titleForDemo = "Long-tap on any of presented controls"
    
    private var messageForDevice = """
    Settings → Display & Brightness → Text Size

    Increase text size until this message goes away.
    """
    
    private var messageForSimulator = """
    Open Xcode, go to the top menu bar. 
    From there choose Xcode → Open Developer Tools → Accessibility Inspector.

    Select simulator in top left corner of Accessibility Inspector.

    Now select the last tab in top right corner.

    Increase font size until this message goes away.
    """
}

// MARK: Update for state
extension HelperViewController {
    private func updateInfo(for contentSizeCategory: UIContentSizeCategory) {
        let isAccessible = contentSizeCategory.isAccessibilityCategory
        
        let title = isAccessible ? titleForDemo : titleForInfo
        let message = UIDevice.isSimulator ? messageForSimulator : messageForDevice
        
        titleLabel.text = title
        messageLabel.text = message
        
        let hideMessageLabel = isAccessible
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        self.messageLabel.isHidden = hideMessageLabel
                        self.stackView.layoutIfNeeded()
        }, completion: nil)
    }
}

// MARK: State observation
extension HelperViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateInfo(for: traitCollection.preferredContentSizeCategory)
    }
}
