import Foundation

class ChatPresenter: ChatPresenterInputProtocol {
    weak var view: ChatPresenterOutputProtocol?
    var interactor: ChatInteractorInputProtocol?
    
    func viewDidLoad() {
        let messages = interactor?.getMessages() ?? []
        view?.displayMessages(messages)
    }
    
    func sendMessage(_ text: String) {
        interactor?.sendMessage(text)
    }
}

extension ChatPresenter: ChatInteractorOutputProtocol {
    func didReceiveMessage(_ message: ChatMessage) {
        view?.showMessage(message)
    }
}
