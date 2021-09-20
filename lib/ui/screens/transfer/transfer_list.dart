import 'package:bytebank/model/transfer_pojo.dart';
import 'package:bytebank/ui/components/transfer/transfer_list_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'create_transfer_form.dart';

class TransferList extends StatefulWidget {
  TransferList({
    Key? key,
  }) : super(key: key);

  @override
  State<TransferList> createState() => TransferListState();
}

class TransferListState extends State<TransferList> {
  final List<TransferPojo?> _transfers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferências',
        ),
      ),
      body: TransferListWidget(transfers: _transfers),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          navigateToForm(context);
        },
      ),
    );
  }

  void navigateToForm(BuildContext context) async {
    TransferPojo transferCreated = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransferForm(),
        ));
    if (transferCreated != null) {
      setState(() {
        _transfers.add(transferCreated);
      });
    }
  }
}
