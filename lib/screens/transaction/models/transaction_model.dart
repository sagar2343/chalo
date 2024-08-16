class TransactionList {
  String title;
  String amount;
  String date;
  String time;
  String route;
  String startStop;
  String endStop;
  int count;
  String? isFailed;

  TransactionList({required this.count,required this.route,required this.startStop,required this.endStop, required this.title, required this.amount, required this.date, required this.time, this.isFailed});

  // Convert a TransactionList object to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'date': date,
      'time': time,
      'isFailed': isFailed,
      'route': route,
      'startStop': startStop,
      'endStop' : endStop,
      'count': count,
    };
  }

  // Create a TransactionList object from a map
  factory TransactionList.fromMap(Map<String, dynamic> map) {
    return TransactionList(
      title: map['title'] ?? '',
      amount: map['amount'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      isFailed: map['isFailed'],
      route: map['route']  ?? '',
      startStop: map['startStop'] ?? '',
      endStop: map['endStop'] ?? '',
      count: map['count'] ?? 1,
    );
  }
}
