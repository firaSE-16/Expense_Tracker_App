import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/expense.dart';
import 'package:flutter_application_5/widgets/explenses_list/expenses_list.dart';
import 'package:flutter_application_5/widgets/new_expense.dart'; // Import your list widget

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(title: 'Lunch', amount: 12.50, date: DateTime.now(), category: Category.food),
    Expense(title: 'Flight Ticket', amount: 250.0, date: DateTime.now(), category: Category.travel),
  ];

_openAddExpenseOverlay(){

  showModalBottomSheet(context: context, builder: (ctx)=>NewExpense(),);

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Flutter ExpenseTracker'),
       actions: [ IconButton(
          onPressed: _openAddExpenseOverlay,
          icon:Icon(Icons.add)
          ),]
      ),
      body: Column(
        
        children: [
          const Text('The chart'),
          Expanded(child:ExpensesList(expenses: _expenses)),
        ],
      ),
    );
  }
}
