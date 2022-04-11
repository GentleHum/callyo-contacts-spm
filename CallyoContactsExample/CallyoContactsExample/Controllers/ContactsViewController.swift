//
//  ContactsViewController.swift
//  CallyoContactsExample
//
//  Created by Michael Vork on 4/7/22.
//

import UIKit
import CallyoContacts

class ContactsViewController: UIViewController {
    private var callyoContactsViewController: CallyoContactsViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        callyoContactsViewController = CallyoContacts.embedController(
            in: self,
            frame: getEmbeddedFrame(),
            delegate: nil
        )
    }
    
    private func getEmbeddedFrame() -> CGRect {
        let viewFrame = self.view.frame
        let safeAreaBottomPadding = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        return CGRect(
            x: viewFrame.minX,
            y: viewFrame.minY + 72,
            width: viewFrame.width,
            height: viewFrame.height - 100 - 72 - safeAreaBottomPadding
        )
    }
}
