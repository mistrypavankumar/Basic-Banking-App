class TransectionDetails {
  final int id;
  final int transectionId;
  final String userName;
  final DateTime transectionAt;
  final double transectionAmount;
  final bool transectionDone;

  TransectionDetails({
    this.id,
    this.transectionId,
    this.userName,
    this.transectionAmount,
    this.transectionAt,
    this.transectionDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transectionId': transectionId,
      'userName': userName,
      'transectionAmount': transectionAmount,
      'transectionAt': transectionAt,
      'transectionDone': transectionDone,
    };
  }
}
