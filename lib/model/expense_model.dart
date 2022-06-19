class TransactionModel {
  final String transactionName;
  final int sum;

  TransactionModel({
    required this.transactionName,
    required this.sum,
  });

  factory TransactionModel.fromJson(dynamic json) => TransactionModel(
        transactionName: json['expenseName'],
        sum: json['sum'],
      );

  Map<String, dynamic> toJson() => {
        'expenseName': transactionName,
        'sum': sum,
      };
}
