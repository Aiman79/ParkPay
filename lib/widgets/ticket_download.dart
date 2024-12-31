import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TicketDownload {
  static Future<void> downloadTicket(
      String websiteName,
      String userName,
      String parkingTimings,
      String location,
      double amount,
      ) async {
    final ticketContent = '''
      Website: $websiteName
      User Name: $userName
      Parking Timings: $parkingTimings
      Location: $location
      Amount Paid: \$${amount.toStringAsFixed(2)}
    ''';

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/ticket.txt');
    await file.writeAsString(ticketContent);
  }
}
