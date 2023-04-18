//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Students on 28.12.2022.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var currentMonthStartDate: Date = Date()
    
    //MARK: Expense / Income Tab
    @Published var tabName: ExpenseType = .expense 
    
    
    init() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: Date())
        
        startDate = calendar.date(from: components)!
        currentMonthStartDate = calendar.date(from: components)!
    }
    
    //MARK: This is a Sample Data of Month May
    
    
    
    @Published var expeneses: [Expense] = sample_expenses
    
    // MARK: Fetching Current Month Date String
    
    func currentMonthDateString() -> String {
        return currentMonthStartDate.formatted(date: .abbreviated, time: .omitted) + " - " +
        Date().formatted(date: .abbreviated, time: .omitted)
    }
    
    func convertExpensesToCurrency(expenses: [Expense], type: ExpenseType = .all) -> String {
        var value: Double = 0
        value = expenses.reduce(0, { partialResult, expense in
            return partialResult + (type == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (expense.type == type ? expense.amount : 0))
        })
        
        
        
        return convertNumberToPrice(value: value)
        
    }
    
    // MARK: Converting Selected Dates To String
    func ConvertDateToString() -> String {
        return startDate.formatted(date: .abbreviated, time: .omitted) + " - " +
        endDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    
    // MARK: Converting Number to Price
    
    func convertNumberToPrice(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
    
}


