//
//  ViewController.swift
//  TemplatePattern
//
//  Created by M on 09.05.2021.
//  Copyright © 2021 M. All rights reserved.
//

import UIKit

enum MatrixOperationType {
    case transpose, determinant, add
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // создаем входные файлы с примерами для каждой операции
        GenerateData.createFilesWithDataIn()

        // запускаем операции ...

        // 1. транспонирование:
        doOperationWithType(.transpose, fileIn: "transposeIn", fileOut: "transponseOut")

        // 2. нахождение определителя:
        doOperationWithType(.determinant, fileIn: "determinantIn", fileOut: "determinantOut")

        // 3. сложение матриц:
        doOperationWithType(.add, fileIn: "additionIn", fileOut: "additionOut")
    }

    private func doOperationWithType(_ type: MatrixOperationType, fileIn: String, fileOut: String) {
        switch type {
        case .transpose:
            let operation = MatrixOperationTranspose()
            operation.doOperation(fileIn: fileIn, fileOut: fileOut)
        case .determinant:
            let operation = MatrixOperationDeterminant()
            operation.doOperation(fileIn: fileIn, fileOut: fileOut)
        case .add:
            let operation = MatrixOperationAddition()
            operation.doOperation(fileIn: fileIn, fileOut: fileOut)
        }
    }
}
