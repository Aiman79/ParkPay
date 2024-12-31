import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;
import 'dart:typed_data';

class PDFGenerator {
  static Future<String> generateTicket({
    required String websiteName,
    required String userName,
    required String parkingTimings,
    required String location,
    required double amount,
  }) async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(websiteName, style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 16),
              pw.Text("User Name: $userName"),
              pw.Text("Parking Timings: $parkingTimings"),
              pw.Text("Location: $location"),
              pw.Text("Amount Paid: \$${amount.toStringAsFixed(2)}"),
            ],
          ),
        ),
      );

      final pdfData = await pdf.save();

      // Web-specific logic for file download
      if (html.window.document != null) {
        final blob = html.Blob([Uint8List.fromList(pdfData)]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..target = 'blank'
          ..download = 'ticket.pdf'
          ..click();
        html.Url.revokeObjectUrl(url);
      }

      return 'ticket.pdf'; // Return a mock file path for compatibility
    } catch (e) {
      print("Error generating ticket: $e");
      throw Exception("Failed to generate ticket.");
    }
  }
}
