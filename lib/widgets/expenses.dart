import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/expense.dart';
import 'package:flutter_application_5/widgets/chart/chart.dart';
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
    isScrollControlled: true, 
    builder: (ctx) =>  NewExpense(onAddExpense: _addNewExpense,),
  );
}
void _removedExpense(Expense expense) {
  final expenseIndex = _expenses.indexOf(expense);
  setState((){
    _expenses.remove(expense); 
  });
  ScaffoldMessenger.of(context).clearSnackBars(); 
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 3),
    content: const Text('Expense deleted.'),
    action:SnackBarAction(label: 'Undo', onPressed: () {
      setState((){
        _expenses.insert(expenseIndex,expense);
      });
    }) ,
    )
    
    );
  
 
}


  void _addNewExpense(Expense newExpense) {
    setState(() {
      _expenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No expense found. Start adding some!'));
    
  if(_expenses.isNotEmpty){
    mainContent = Expanded(child: ExpensesList(expenses: _expenses,onRemoveExpense: _removedExpense,));

  }


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
          Chart(expenses: _expenses), 
          mainContent, 
          
        ],
      ),
    );
  }
}
