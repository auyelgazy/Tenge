//
//  Cashflow.swift
//  Tenge
//
//  Created by Kuanysh al-Khattab Auyelgazy on 18.04.2023.
//

import Foundation

enum CashflowType {
    case income
    case expense
}

enum Category: String {
    case uncategorized = "Uncategorized"
    case food = "Food"
    case health = "Health"
    case education = "Education"
    // ...
}

struct Cashflow {
    let cashflowType: CashflowType
    let value: Int
    let category: Category

    init(cashflowType: CashflowType, value: Int, category: Category = .uncategorized) {
        self.cashflowType = cashflowType
        self.value = value
        self.category = category
    }
}

extension Cashflow {
    static let list: [Cashflow] = [
        Cashflow(cashflowType: .expense, value: 1),
        Cashflow(cashflowType: .expense, value: 2, category: .food),
        Cashflow(cashflowType: .income, value: 3),
        Cashflow(cashflowType: .expense, value: 2500),
        Cashflow(cashflowType: .expense, value: 500, category: .education),
        Cashflow(cashflowType: .income, value: 80000),
        Cashflow(cashflowType: .expense, value: 2500),
        Cashflow(cashflowType: .expense, value: 500, category: .food),
        Cashflow(cashflowType: .income, value: 80000),
        Cashflow(cashflowType: .expense, value: 2500),
        Cashflow(cashflowType: .expense, value: 500, category: .food),
        Cashflow(cashflowType: .income, value: 80000),
        Cashflow(cashflowType: .expense, value: 2500),
        Cashflow(cashflowType: .expense, value: 500, category: .food),
        Cashflow(cashflowType: .income, value: 80000),
        Cashflow(cashflowType: .expense, value: 2500),
        Cashflow(cashflowType: .expense, value: 500, category: .food),
        Cashflow(cashflowType: .income, value: 80000),
        Cashflow(cashflowType: .expense, value: 2500),
        Cashflow(cashflowType: .expense, value: 500, category: .food),
        Cashflow(cashflowType: .income, value: 80000),
    ]
}
