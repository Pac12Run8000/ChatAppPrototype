import Foundation

protocol ChatPresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func sendMessage(_ text: String)
}
