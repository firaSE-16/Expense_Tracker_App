import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/expense.dart';
import 'package:flutter_application_5/widgets/explenses_list/expense_item.dart';
import 'package:flutter_application_5/widgets/explenses_list/expenses_list.dart';
import 'package:flutter_application_5/widgets/new_expense.dart'; 

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

 void _openAddExpenseOverlay() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Ensures the modal sheet is fully interactive
    builder: (ctx) =>  NewExpense(onAddExpense: _addNewExpense,),
  );
}
void _removedExpense(Expense expense) {
  setState((){
    _expenses.remove(expense); 
  });

 
}


  void _addNewExpense(Expense newExpense) {
    setState(() {
      _expenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'), // Placeholder for future chart
          Expanded(child: ExpensesList(expenses: _expenses,onRemoveExpense: _removedExpense,)),
        ],
      ),
    );
  }
}
