import SwiftUI

class ChatRouter: ChatRouterProtocol {
    static func createChatModule() -> AnyView {
        let mediator = ChatViewMediator()
        let presenter = ChatPresenter()
        let interactor = ChatInteractor()
        let router = ChatRouter()
        
        presenter.view = mediator
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        let view = ChatView(mediator: mediator, presenter: presenter)
        return AnyView(view)
    }
}
