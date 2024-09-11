import 'package:flutter/material.dart';
import 'package:health/chartList.dart';
import 'package:health/contactus.dart';
import 'package:health/infoPage.dart';
import 'package:health/langaugeselection.dart';
import 'package:health/pdfdownload.dart';
import 'package:health/periods_tracker.dart';
import 'package:health/privacy_detail.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Profile'),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Account Section with Border
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Personal Data'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Personal Data
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Activity History'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> ChartList()));
                        // Navigate to Activity History
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.data_exploration),
                      title: Text('Periods-Tracker'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Workout Progress
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PeriodTrackerScreen()));
                      },
                    ),
                  ],
                ),
              ),


              SizedBox(height: 20),

              // Other Section with Border
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Other', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text('Contact Us'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to Contact Us
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contactus()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip),
                      title: Text('Privacy Policy'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyDetail()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Language'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: ()
                      {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LanguageSelectionScreen()));

                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Pdf-Download'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: ()
                      {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PDFGeneratorScreen()));

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

