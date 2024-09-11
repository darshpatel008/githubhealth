import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;  // Import the pdf package
import 'package:path_provider/path_provider.dart'; // Optional, for saving PDF to device storage
import 'package:flutter/services.dart' show rootBundle; // For loading assets like fonts

class PDFGeneratorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Generate PDF'),
          onPressed: () async {
            await generatePDF();
          },
        ),
      ),
    );
  }

  Future<void> generatePDF() async {
    final pdf = pw.Document(); // Create a new PDF document

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World!', style: pw.TextStyle(fontSize: 40)),
          );
        },
      ),
    );

    // Save the PDF file to local storage (optional)
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());

    print("PDF Generated: ${file.path}");
  }
}