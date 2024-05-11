class Address {
  int addressId;
  String accountId;
  String address;
  int status;

  Address({
    required this.addressId,
    required this.accountId,
    required this.address,
    required this.status,
  });

  // Hàm factory để tạo một đối tượng Address từ một Map
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      addressId: map['addressId'],
      accountId: map['accountId'],
      address: map['address'],
      status: map['status'], // Chuyển đổi giá trị status từ 0/1 thành true/false
    );
  }

  // Hàm để chuyển đối tượng Address thành một Map
  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
      'address': address,
      'status': status, // Chuyển đổi giá trị boolean thành 0 hoặc 1
    };
  }
}
