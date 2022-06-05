import 'dart:convert';

List<SavingAccount> savingAccountFromJson(String str) => List<SavingAccount>.from(json.decode(str).map((x) => SavingAccount.fromJson(x)));

String savingAccountToJson(List<SavingAccount> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SavingAccount {
  SavingAccount({
    this.type,
    this.id,
    this.balance,
    this.createdAt,
    this.status,
    this.interestRate,
  });

  String? type;
  String? id;
  double? balance;
  DateTime? createdAt;
  String? status;
  double? interestRate;

  factory SavingAccount.fromJson(Map<String, dynamic> json) => SavingAccount(
    type: json["type"],
    id: json["id"],
    balance: json["balance"].toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    status: json["status"],
    interestRate: json["interestRate"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "balance": balance,
    "createdAt": createdAt?.toIso8601String(),
    "status": status,
    "interestRate": interestRate,
  };
}
