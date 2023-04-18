//
//  ExpenseCard.swift
//  ExpenseTracker
//
//  Created by Students on 04.01.2023.
//

import SwiftUI

struct ExpenseCard: View {
    
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    
    var body: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(colors:
                                    [.blue.opacity(0.9),
                                    .pink,
                                    .orange],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                )
            VStack(spacing: 15){
                VStack(spacing: 15) {
                    //MARK: Currently Going Month Date String
                    Text(expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    //MARK: Current Month Expense Price
                    Text(expenseViewModel
                        .convertExpensesToCurrency(expenses: expenseViewModel.expeneses)
                    )
                    .font(.system(size: 35, weight: .bold))
                    .lineLimit(1)
                    .padding(.bottom, 5)
                }
                .offset(y: -10)
                
                HStack(spacing: 15) {
                    Image(systemName: "arrow.down")
                        .font(.caption)
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in:
                                        Circle()
                        )
                
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption)
                        //.opacity(0.7)
                        
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expeneses, type: .income))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "arrow.up")
                        .font(.caption)
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7), in:
                                        Circle()
                        )
                
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Expenses")
                            .font(.caption)
                        //.opacity(0.7)
                        
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expeneses, type: .expense))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal)
                //.padding(.trailing)
                .offset(y: 15)
                
            }
            .foregroundColor(.white )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 220)
        .padding(.top)
    }
}

