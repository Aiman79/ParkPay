import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class TicketDownloadDialog extends StatelessWidget {
  final String ticketPath;

  TicketDownloadDialog({required this.ticketPath});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ticket Generated"),
      content: Text("Your ticket has been successfully generated and saved."),
      actions: [
        TextButton(
          onPressed: () {
            OpenFile.open(ticketPath);
          },
          child: Text("Open Ticket"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
      ],
    );
  }
}
