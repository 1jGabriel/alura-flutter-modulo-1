import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferências',
        ),
      ),
      body: const TransferList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => print("abc"),
      ),
    ),
  ));
}

class TransferList extends StatelessWidget {
  const TransferList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransferItem(TransferPojo(2.0, '123')),
        TransferItem(TransferPojo(3.0, '123')),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final TransferPojo _transfer;

  const TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text(_transfer.value.toString()),
      subtitle: Text(_transfer.account),
    ));
  }
}

class TransferPojo {
  final double value;
  final String account;

  TransferPojo(this.value, this.account);
}
