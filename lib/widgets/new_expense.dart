import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpense});
 final void Function(Expense expense) onAddExpense;
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

 

  void _saveExpense() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedDate == null ||
        _selectedCategory == null) {
          showDialog(context: context, builder: (ctx)=>AlertDialog(
            title:Text('Invalid input'),
            content: const Text('Please make sure a valid titel, amount date and category was Entered.'),
            actions:[
              TextButton(
                onPressed: (){
                  Navigator.pop(ctx);
                }, child: const Text('Okay'),
              )
            ]
          ));
      return;
    }
    widget.onAddExpense(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory!));

    print("Title: $enteredTitle");
    print("Amount: $enteredAmount");
    print("Date: ${formatter.format(_selectedDate!)}");
    print("Category: $_selectedCategory");
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              labelText: 'Amount',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(_selectedDate == null
                  ? 'No date selected'
                  : formatter.format(_selectedDate!)),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButton<Category>(
            value: _selectedCategory,
            hint: const Text("Select Category"),
            isExpanded: true,
            items: Category.values.map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (Category? newValue) {
              setState(() {
                _selectedCategory = newValue;
              });
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
