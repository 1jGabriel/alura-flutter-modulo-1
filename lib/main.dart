import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: TransferForm(),
    ));
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Transfer Form")),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _accountNumberController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                    labelText: 'Número da conta', hintText: '0000'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0.00'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final amount = double.tryParse(_amountController.text);
                  final accountNumber = _accountNumberController.text;
                  if (amount != null) {
                    final transferPojo = TransferPojo(amount, accountNumber);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('$transferPojo')));
                  }
                },
                child: const Text('Criar transferencia'))
          ],
        ));
  }
}

class TransferList extends StatelessWidget {
  const TransferList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferências',
        ),
      ),
      body: Column(
        children: <Widget>[
          TransferItem(TransferPojo(2.0, '123')),
          TransferItem(TransferPojo(3.0, '123')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => debugPrint("abc"),
      ),
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

  @override
  String toString() {
    return 'TransferPojo{value: $value, account: $account}';
  }
}
