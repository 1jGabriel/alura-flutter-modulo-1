import 'package:bytebank/model/transfer_pojo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransferListWidget extends StatelessWidget {
  const TransferListWidget({
    Key? key,
    required List<TransferPojo?> transfers,
  })  : _transfers = transfers,
        super(key: key);

  final List<TransferPojo?> _transfers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _transfers.length,
      itemBuilder: (context, index) {
        final item = _transfers[index];
        return TransferItem(item ?? TransferPojo(1003.0, '10030'));
      },
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
