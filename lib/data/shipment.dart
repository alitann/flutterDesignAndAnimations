class Shipment {
  final String status;
  final String title;
  final String description;
  final String amount;
  final String date;
  final String receiptNumber;
  final String origin;
  final String destination;
  final String productName;

  Shipment({
    required this.productName,
    required this.destination,
    required this.origin,
    required this.receiptNumber,
    required this.status,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
  });
}
