//import UIKit
//
//public struct CallyoContacts {
//    public private(set) var text = "Hello, World!"
//    public private(set) var storyboard: UIStoryboard?
//
//    public init() {
//        storyboard = UIStoryboard(name: "CallyoContacts", bundle: Bundle.module)
//    }
//}

import UIKit

@objc public protocol CallyoContactsActionDelegate {
    @objc optional func getSubscriptionWasChosen()
    @objc optional func makeCallWasChosen(for phoneNumber: String)
    @objc optional func makeVideoCallWasChosen(for phoneNumber: String)
    @objc optional func sendTextWasChosen(for phoneNumber: String)
}

public class CallyoContacts {
    
    public static var delegate: CallyoContactsActionDelegate? = nil
    
    public static func embedController(
        in parentController: UIViewController,
        frame: CGRect,
        delegate: CallyoContactsActionDelegate?
    ) -> CallyoContactsViewController? {
        self.delegate = delegate
        let storyboard = UIStoryboard(name: "CallyoContacts", bundle: Bundle.module)
        if let contactsController = storyboard.instantiateInitialViewController() as? CallyoContactsViewController {
            parentController.addChild(contactsController)
            parentController.view.addSubview(contactsController.view)
            contactsController.view.frame = frame
            contactsController.view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
            contactsController.didMove(toParent: parentController)
            contactsController.delegate = delegate
            return contactsController
        }
        
        return nil
    }
}
