class TransectionDetails {
  final int id;
  final int transectionId;
  final String userName;
  final String senderName;
  final double transectionAmount;
  // final bool transectionDone;

  TransectionDetails({
    this.id,
    this.transectionId,
    this.userName,
    this.transectionAmount,
    this.senderName,
    // this.transectionDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transectionId': transectionId,
      'userName': userName,
      'senderName': senderName,
      'transectionAmount': transectionAmount,
      // 'transectionDone': transectionDone,
    };
  }
}
