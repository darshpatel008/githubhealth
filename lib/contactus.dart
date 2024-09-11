import 'package:flutter/material.dart';

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
 final List<String> link = ["Linkedin: https://www.linkedin.com/in/darsh-viroja-21416728a/",
                            "Linkedin: https://www.linkedin.com/in/poojan-delvadiya-72a4352a0",
                           "Linkedin: https://www.linkedin.com/in/aaryan-vagadiya-6b2b16221/"
                          ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          // Wrapping ListView in Expanded to provide constraints
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(link[index]),
              ),
              separatorBuilder: (context, index) => Divider(
                height: 50, // Adjusting the height of the separator
                thickness: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
