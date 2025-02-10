import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

final _titleController = TextEditingController();

void dipose(){
  _titleController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
          controller: _titleController,
          
          maxLength:50,
          decoration:const InputDecoration(
            label:Text('Title'
            )
          )
          ),
         Row(children: [
          ElevatedButton(
            onPressed: () {
              print(_titleController.text); 
            },
            child:Text('Save Expense')
          )
         ],)
        ],
        

      ),
    );
  }
}