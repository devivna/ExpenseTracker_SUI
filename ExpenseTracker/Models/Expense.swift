//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Students on 28.12.2022.
//

import SwiftUI

struct Expense: Identifiable, Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: Color
}

enum ExpenseType: String {
    case income = "Income"
    case expense = "Expenses"
    case all = "All"
}

var sample_expenses: [Expense] = [
    Expense(remark: "Keyboard", amount: 100, date: Date(), type: .expense, color: .yellow),
    Expense(remark: "Food", amount: 1000, date: Date(), type: .income, color: .red),
    Expense(remark: "Taxi", amount: 50, date: Date(), type: .expense, color: .green),
    Expense(remark: "Amazon Purchases", amount: 150, date: Date(), type: .expense, color: .yellow),
    Expense(remark: "Movie Ticket", amount: 300, date: Date(), type: .income, color: .orange)
]
