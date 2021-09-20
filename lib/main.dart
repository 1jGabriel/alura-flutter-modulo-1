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
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => TransferList(),
      '/create-transfer': (context) => TransferForm()
    });
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
            Editor(
              controller: _accountNumberController,
              label: 'Número da conta',
              hint: '0000',
            ),
            Editor(
              controller: _amountController,
              label: 'Valor',
              hint: '0.00',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
                onPressed: () {
                  createTransfer(context);
                },
                child: const Text('Criar transferencia'))
          ],
        ));
  }

  void createTransfer(BuildContext context) {
    final amount = double.tryParse(_amountController.text);
    final accountNumber = _accountNumberController.text;
    if (amount != null) {
      final transferPojo = TransferPojo(amount, accountNumber);
      Navigator.pop(context, transferPojo);
      debugPrint('$transferPojo');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;

  Editor({
    required this.controller,
    required this.label,
    required this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  final List<TransferPojo?> _transfers = [];

  TransferList({
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
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          final item = _transfers[index];
          if (item != null) {
            debugPrint('$item');
            return TransferItem(item);
          } else {
            return Spacer();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.pushNamed(
            context,
            '/create-transfer'
          );
          future.then((transferCreated) => {_transfers.add(transferCreated)});
        },
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
