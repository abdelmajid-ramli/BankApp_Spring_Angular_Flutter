import 'dart:convert';

List<Operation> operationFromJson(String str) => List<Operation>.from(json.decode(str).map((x) => Operation.fromJson(x)));

String operationToJson(List<Operation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Operation {
  Operation({
    this.id,
    this.operationDate,
    this.amount,
    this.type,
    this.description,
  });

  int? id;
  DateTime? operationDate;
  double? amount;
  Type? type;
  Description? description;

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
    id: json["id"],
    operationDate: DateTime.parse(json["operationDate"]),
    amount: json["amount"].toDouble(),
    type: typeValues.map[json["type"]],
    description: descriptionValues.map[json["description"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "operationDate": operationDate?.toIso8601String(),
    "amount": amount,
    "type": typeValues.reverse[type],
    "description": descriptionValues.reverse[description],
  };
}

enum Description { CREDIT, DEBIT }

final descriptionValues = EnumValues({
  "Credit": Description.CREDIT,
  "Debit": Description.DEBIT
});

enum Type { CREDIT, DEBIT }

final typeValues = EnumValues({
  "CREDIT": Type.CREDIT,
  "DEBIT": Type.DEBIT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
