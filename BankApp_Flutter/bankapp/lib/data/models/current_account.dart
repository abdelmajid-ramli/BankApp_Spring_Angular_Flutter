import 'dart:convert';

List<CurrentAccount> currentAccountFromJson(String str) => List<CurrentAccount>.from(json.decode(str).map((x) => CurrentAccount.fromJson(x)));

String currentAccountToJson(List<CurrentAccount> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrentAccount {
  CurrentAccount({
    this.type,
    this.id,
    this.balance,
    this.createdAt,
    this.status,
    this.overDraft,
  });

  String? type;
  String? id;
  double? balance;
  DateTime? createdAt;
  String? status;
  double? overDraft;

  factory CurrentAccount.fromJson(Map<String, dynamic> json) => CurrentAccount(
    type: json["type"],
    id: json["id"],
    balance: json["balance"].toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    status: json["status"],
    overDraft: json["overDraft"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "balance": balance,
    "createdAt": createdAt?.toIso8601String(),
    "status": status,
    "overDraft": overDraft,
  };
}
