import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //Step 1 change to stateful widget...
  late final Function addTrx;

  NewTransaction(this.addTrx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //Define the variable for handling changes to a TextField....
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  //2 Add method/function submitData()...
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    //To verify the data entry..
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print('#Debug2 - Passing 2..');
      return;
    }

    widget.addTrx(
        //Step 2) Addin widget for addTrx..
        enteredTitle, //Replace with variable..
        enteredAmount //Replace with variable..
        );
    // 3) Adding Navigator to automatically close the Modal Bottom Sheet (dialog box) after user key-in the new record...

    Navigator.of(context).pop();

    print('#Debug2 - Passing 1..');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => { titleInput = val},   // Note: 1st approach
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number, //1) Adding keyboardType
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => { amountInput = val},
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                print(titleController);
                print(amountController);
                (_) => submitData(); //Adding function to Button...

                /*addTrx(
                  titleController.text,
                  double.parse(amountController.text),
                ); */
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}