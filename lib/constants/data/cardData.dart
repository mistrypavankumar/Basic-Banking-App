import 'package:basic_banking_app/constants/constants.dart';
class CardData {
  final int id;
  final String cardNumber;
  final String cardHolderName;
  final String cardExpiryDate;
  final String avatar;
  final mgPrimaryGradient;

  CardData({
    this.id,
    this.cardNumber,
    this.cardHolderName,
    this.cardExpiryDate,
    this.avatar,
    this.mgPrimaryGradient
  });

  static List<CardData> cardDataList = [
    CardData(
        id: 0,
        cardNumber: "**** **** **** 7143",
        cardHolderName: "M.Pavan Kumar",
        cardExpiryDate: "07-02-2025",
        avatar: "MP",
        mgPrimaryGradient: mgPrimaryGradient0,
        ),
    CardData(
        id: 1,
        cardNumber: "**** **** **** 7142",
        cardHolderName: "Ch.Meghana",
        cardExpiryDate: "08-02-2025",
        avatar: "CM",
        mgPrimaryGradient:mgPrimaryGradient1, 
        ),
    CardData(
        id: 2,
        cardNumber: "**** **** **** 9423",
        cardHolderName: "D.SaiKamal",
        cardExpiryDate: "25-01-2025",
        avatar: "DS",
        mgPrimaryGradient:mgPrimaryGradient2, 
        ),
    CardData(
        id: 3,
        cardNumber: "**** **** **** 7463",
        cardHolderName: "D.SaiTeja",
        cardExpiryDate: "01-07-2025",
        avatar: "DS",
        mgPrimaryGradient:mgPrimaryGradient3,
        ),
    CardData(
        id: 4,
        cardNumber: "**** **** **** 1463",
        cardHolderName: "B.Manoj",
        cardExpiryDate: "02-08-2025",
        avatar: "BM",
        mgPrimaryGradient:mgPrimaryGradient4, 
        ),
    CardData(
        id: 5,
        cardNumber: "**** **** **** 1163",
        cardHolderName: "B.Rithvik",
        cardExpiryDate: "25-09-2025",
        avatar: "BR",
        mgPrimaryGradient:mgPrimaryGradient5, 
        ),
    CardData(
        id: 6,
        cardNumber: "**** **** **** 7883",
        cardHolderName: "Vamshi",
        cardExpiryDate: "22-08-2025",
        avatar: "V",
        mgPrimaryGradient:mgPrimaryGradient6, 
        ),
    CardData(
        id: 7,
        cardNumber: "**** **** **** 9963",
        cardHolderName: "Srinivas",
        cardExpiryDate: "19-04-2025",
        avatar: "S",
        mgPrimaryGradient:mgPrimaryGradient7, 
        ),
    CardData(
        id: 8,
        cardNumber: "**** **** **** 7463",
        cardHolderName: "Vinay",
        cardExpiryDate: "05-05-2025",
        avatar: "V",
        mgPrimaryGradient:mgPrimaryGradient8 
        ),
    CardData(
        id: 9,
        cardNumber: "**** **** **** 7773",
        cardHolderName: "Rakesh Kumar",
        cardExpiryDate: "16-10-2025",
        avatar: "RK",
        mgPrimaryGradient:mgPrimaryGradient9 
        ),
  ];
}
