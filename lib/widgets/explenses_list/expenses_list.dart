import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/expense.dart';

import 'package:flutter_application_5/widgets/explenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});




  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        }
        ,key: ValueKey(expenses[index]), 
        child:  ExpenseItem(expenses[index])),
    );
  }
}

