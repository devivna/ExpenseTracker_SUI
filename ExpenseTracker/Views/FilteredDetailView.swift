//
//  FilteredDetailView.swift
//  ExpenseTracker
//
//  Created by Students on 04.01.2023.
//

import SwiftUI

struct FilteredDetailView: View {
    
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    
                    //MARK: Back Button
                    
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .black.opacity(0.1), radius: 5, x:5, y: 5)
                    }
                    
                    
                    
                    Text("Transactions")
                        .font(.title)
                        .bold()
                        .opacity(0.7)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .black.opacity(0.1), radius: 5, x:5, y: 5)
                    }
                }
                
                // MARK: Expense Card View for Currently Selected Date
                ExpenseCard()
                    .environmentObject(expenseViewModel)
                CustomSegmentedControl()
                    .padding(.top)
                
                // MARK: Currently Filtered Date With Amount
                VStack(spacing: 15) {
                    Text(expenseViewModel.ConvertDateToString())
                        .opacity(0.7)
                    Text(expenseViewModel.convertExpensesToCurrency(
                        expenses: expenseViewModel.expeneses,
                        type: expenseViewModel.tabName))
                    .font(.title)
                    .bold()
                    .opacity(0.9)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                }
                .padding(.vertical, 20)
                
            }
            .padding()
        }
        .toolbar(.hidden)
        .background(
            .brown.opacity(0.3)
        )
    }
    
    //MARK: Custom Segmented Control
    @ViewBuilder
    func CustomSegmentedControl() -> some View {
        HStack(spacing: 0) {
            ForEach([ExpenseType.expense, ExpenseType.income], id: \.rawValue) {tab in
                Text(tab.rawValue)
                    .fontWeight(.semibold)
                    .foregroundColor(expenseViewModel.tabName == tab ? .white : .black)
                    .opacity(expenseViewModel.tabName == tab ? 1 : 0.7)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background{
                        // MARK: With Matched Geometry Effect
                        if expenseViewModel.tabName == tab {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(colors: [.blue, .pink, .orange],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing)
                                )
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation{expenseViewModel.tabName = tab}
                    }
                
            }
        }
        .padding(5)
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
        )
    }
    
}

struct FilteredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredDetailView()
            .environmentObject(ExpenseViewModel())
    }
}
