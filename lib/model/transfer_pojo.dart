class TransferPojo {
  final double value;
  final String account;

  TransferPojo(this.value, this.account);

  @override
  String toString() {
    return 'TransferPojo{value: $value, account: $account}';
  }
}
