import SwiftUI

extension Color {
    static let tabBarBackground = Color("TabBarBackground")
    static let tabBarUnselected = Color("TabBarUnselected")
    static let tabBarAccent = Color("TabBarAccent")
}

extension UIColor {
    convenience init(_ color: Color) {
        self.init(color)
    }
}
