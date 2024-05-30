//
//  AlertControllerBuilderRM.swift
//  debtsRM
//
//  Created by Anna Ablogina on 30.05.2024.
//

import UIKit


/**
 Для создания `UIAlertController` с разными полями в зависимости от контекста редактирования (список задач или отдельная задача) можно использовать паттерн проектирования "Строитель" (Builder pattern). Этот паттерн позволяет создавать сложные объекты с помощью последовательного вызова методов строителя, предоставляя гибкость в конфигурировании объекта.
 */
final class AlertControllerBuilderRM {
    private let alertController: UIAlertController
    
    /**
         Инициализирует экземпляр `AlertControllerBuilder` с указанным заголовком и сообщением.
         
         - Parameters:
           - title: Заголовок предупреждения.
           - message: Текст сообщения предупреждения.
         */
    init(title: String, message: String) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    /**
         Создает текстовое поле с указанным текстом и плейсхолдером.
         
         - Parameters:
            - placeholder: Определяет плейсхолдер для текстового поля
            - text: Определяет текст для отображения в текстовом поле
         - Returns: Ссылка на текущий экземпляр `AlertControllerBuilder` для цепочки вызовов.
         */
    func setTextField(withPlaceholder placeholder: String, andText text: String?) -> AlertControllerBuilderRM {
        alertController.addTextField { textField in
            textField.placeholder = placeholder
            textField.text = text
        }
        return self
    }
    
    /**
         Добавляет действие в `UIAlertController`.
         
         - Parameters:
           - title: Заголовок действия.
           - style: Стиль действия.
           - handler: Замыкание, вызываемое при выборе действия. Принимает заголовок задачи и заголовок заметки в качестве параметров.
         - Returns: Ссылка на текущий экземпляр `AlertControllerBuilder` для цепочки вызовов.
         */
    @discardableResult
    func addAction(title: String, style: UIAlertAction.Style, handler: (() -> Void)? = nil) -> AlertControllerBuilderRM {
        let action = UIAlertAction(title: title, style: style) {_ in
                handler?()
            }
            alertController.addAction(action)
            return self
        }
    
    /**
         Создает и возвращает экземпляр `UIAlertController`, созданный на основе установленных параметров и действий.
         
         - Returns: Экземпляр `UIAlertController`.
         */
    func build() -> UIAlertController {
        alertController
    }
}
