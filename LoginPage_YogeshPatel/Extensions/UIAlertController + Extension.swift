//
//  UIAlertController + Extension.swift
//  LoginPage_YogeshPatel
//
//  Created by csuftitan on 2/20/24.
//

import Foundation
import UIKit

extension UIViewController{
    //Global Alert
    //Define your number of buttons, styles and completion
    
    public func openAlert(title : String,
                        message : String,
                        alertStyle: UIAlertController.Style,
                        actionTitles: [String],
                        actionStyles: [UIAlertAction.Style],
                        actions: [((UIAlertAction)-> Void)]){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        self.present(alertController, animated: true)
        
    }
}
