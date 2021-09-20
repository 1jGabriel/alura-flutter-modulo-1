import 'package:bytebank/model/transfer_pojo.dart';
import 'package:bytebank/ui/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  static const _acountNumberHint = "Número da conta";
  static const _hintAmount = "0,00";
  static const _confirm = "Confirmar";
  static const _transferData = "Dados da transferência";

  final TextEditingController _accountNumberController =
      TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_transferData)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controller: _accountNumberController,
                label: _acountNumberHint,
              ),
              Editor(
                controller: _amountController,
                label: 'Valor',
                hint: _hintAmount,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                  onPressed: () {
                    createTransfer(context);
                  },
                  child: const Text(_confirm))
            ],
          ),
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
