import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //To receive the Transaction list data, need to add List at transaction_list widget
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty?
      Column(
        children: [
          Text("No Transactions added yet..!",
          style: Theme.of(context).textTheme.bodyText1,),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child:Image(image: AssetImage("assets/images/waiting.png") ,fit: BoxFit.cover,),
            
          )
        ],
      )
      :ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2)),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      '\RM${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          // color: Colors.red),
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        /* style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18), */
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      // Text(e.date.toString())
                      Text(
                        DateFormat('dd/MM/yyy')
                            .format(transactions[index].date),
                        //  style: TextStyle(color: Colors.grey),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}