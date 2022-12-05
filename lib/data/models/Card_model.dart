
// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);


import 'dart:convert';

List<CardModel> cardModelFromJson(String str) => List<CardModel>.from(json.decode(str).map((x) => CardModel.fromJson(x)));

String cardModelToJson(List<CardModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardModel {
    CardModel({
        this.id,
        this.cardType,
        this.cardNumber,
        this.bankName,
        this.moneyAmount,
        this.cardCurrency,
        this.expireDate,
        this.iconImage,
        this.colors,
        this.cardCrrency,
    });

    int? id;
    String ?cardType;
    String? cardNumber;
    String? bankName;
    num? moneyAmount;
    String? cardCurrency;
    DateTime? expireDate;
    String? iconImage;
    Colors? colors;
    String? cardCrrency;

    factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"]??'nul keldi',
        cardType: json["card_type"]??'nul keldi',
        cardNumber: json["card_number"]??'nul keldi',
        bankName: json["bank_name"]??'nul keldi',
        moneyAmount: json["money_amount"]??0,
        cardCurrency: json["card_currency"] == null ? null : json["card_currency"],
        expireDate: DateTime.parse(json["expire_date"]),
        iconImage: json["icon_image"]??'nul keldi',
        colors: Colors.fromJson(json["colors"]),
        cardCrrency: json["card_crrency"] == null ? null : json["card_crrency"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "card_type": cardType,
        "card_number": cardNumber,
        "bank_name": bankName,
        "money_amount": moneyAmount,
        "card_currency": cardCurrency == null ? null : cardCurrency,
        "expire_date": expireDate.toString(),
        "icon_image": iconImage,
        "colors": colors,
        "card_crrency": cardCrrency == null ? null : cardCrrency,
    };
}

class Colors {
    Colors({
        this.colorA,
        this.colorB,
    });

    String? colorA;
    String ?colorB;

    factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        colorA: json["color_a"],
        colorB: json["color_b"],
    );

    Map<String, dynamic> toJson() => {
        "color_a": colorA,
        "color_b": colorB,
    };
}
