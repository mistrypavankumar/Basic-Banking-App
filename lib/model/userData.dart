class UserData {
  final int id;
  final String userName;
  final String cardNumber;
  final String cardExpiry;
  final double totalAmount;
  // final DateTime transectionAt;

  UserData({
    this.id,
    this.cardNumber,
    this.cardExpiry,
    this.userName,
    this.totalAmount,
    // this.transectionAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'cardNumber': cardNumber,
      'cardExpiry': cardExpiry,
      'totalAmount': totalAmount,
      // 'transectionAt': transectionAt,
    };
  }
}
