//
//  Helper.swift
//  Task
//
//  Created by Apple on 20/01/2023.
//

import Foundation
import UIKit
struct StringConstant {
    static let emptyField = "This field cannot be empty"
    static let invalidEmail = "Enter valid Email ID"
    static let invalidPassword = "Password should contain atleast one uppercase,\none lowercase, one digit, one special characters(#?!@$%^&*-), minimum 8 characters and maximum 16 characters"
}
struct AppFont {
enum FontType: String {
    case Bold = "Montserrat-Bold"
    case Regular = "Montserrat-Regular"
    case MediumBold = "Montserrat-Medium"
    case SemiBold = "Montserrat-SemiBold"
}
static func font(type: FontType, size: CGFloat) -> UIFont{
    return UIFont(name: type.rawValue, size: size)!
}
}
extension UITextField{
    var isEmpty: Bool{
        return (self.text ?? "").isEmpty
    }
    var isValidPassword: Bool{
        if let text = self.text{
            return text.isValidPassword
        }
        return true
    }
    var isValidEmail: Bool{
        if let text = self.text{
            return text.isValidEmail
        }
        return true
    }
    
}
extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[#?!@$%^&*-]).{8,16}")
        return passwordTest.evaluate(with: self)
    }
}
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    func imageURLLoad(url: URL) {

        DispatchQueue.global().async { [weak self] in
            func setImage(image:UIImage?) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            let urlToString = url.absoluteString as NSString
            if let cachedImage = imageCache.object(forKey: urlToString) {
                setImage(image: cachedImage)
            } else if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: urlToString)
                    setImage(image: image)
                }
            }else {
                setImage(image: nil)
            }
        }
    }
}
extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
}
