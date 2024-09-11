import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Infopage extends StatefulWidget {
  const Infopage({
    super.key,
    required this.whichimage,
    required this.heroTag,
    required this.indexis,
  });

  final String whichimage;
  final String heroTag;
  final int indexis;

  @override
  State<Infopage> createState() => _InfopageState();
}

class _InfopageState extends State<Infopage> {
  // Function to get the appropriate localized string based on index
  String getInfoText(BuildContext context) {
    switch (widget.indexis) {
      case 0:
        return AppLocalizations.of(context)!.heart;
      case 1:
        return AppLocalizations.of(context)!.kidneysAreFailing;
      case 2:
        return AppLocalizations.of(context)!.liver;
      case 3:
        return AppLocalizations.of(context)!.pad;
      case 4:
        return AppLocalizations.of(context)!.asthamaf;
      case 5:
        return AppLocalizations.of(context)!.breastCancer;
      case 6:
        return AppLocalizations.of(context)!.lungCancer;
      case 7:
        return AppLocalizations.of(context)!.stress;
      default:
        return AppLocalizations.of(context)!.asthamaf;
    }
  }

  String titles(BuildContext context) {
    switch (widget.indexis) {
      case 0:
        return AppLocalizations.of(context)!.hearttitle;
      case 1:
        return AppLocalizations.of(context)!.kidneytitle;
      case 2:
        return AppLocalizations.of(context)!.livertitle;
      case 3:
        return AppLocalizations.of(context)!.padtitle;
      case 4:
        return AppLocalizations.of(context)!.asthamatitle;
      case 5:
        return AppLocalizations.of(context)!.breastcancertitle;
      case 6:
        return AppLocalizations.of(context)!.lungstitle;
      case 7:
        return AppLocalizations.of(context)!.stresstitle;
      default:
        return AppLocalizations.of(context)!.asthamatitle;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("Health"),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.heroTag, // Use the dynamic heroTag
                child: Image.asset(
                  widget.whichimage, // Use the passed image path here
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Positioned(
              //   top: 0,
              //   left: 0,
              //   child: IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: const Icon(Icons.arrow_back_ios_new),
              //   ),
              // ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(titles(context),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),)
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  getInfoText(context), // Show the dynamically selected text here
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
