import 'package:flutter/material.dart';
import 'package:health/infoPage.dart';
import 'package:transparent_image/transparent_image.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({super.key});

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  List<String> images = [
    "assests/images/heartimage.jpeg",
    "assests/images/kidney.jpeg",
    "assests/images/liverr.jpeg",
    "assests/images/PAD.jpeg",
    "assests/images/asthama.jpeg",
    "assests/images/breastcancer.jpeg",
    "assests/images/lungs.jpeg",
    "assests/images/stress.jpeg"
  ];

  List<String> smallInfo = ["Heart Failure",
    "Kidneys are failing",
    "Liver Damage",
    "Peripheral Arterial Disease (PAD)",
    "Asthma","Breast Cancer",
    "Lung Cancer",
    "Hypertension (High Blood Pressure)"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Infopage(
                                  whichimage: images[index],
                                  heroTag: images[index],
                                  indexis: index,
                                )));
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: images[index],
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: MemoryImage(kTransparentImage),
                          image: AssetImage(images[index]),
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                              color: Colors.black54, //transparent black
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 44, vertical: 6),
                                  child: Column(children: [
                                    Text(
                                      smallInfo[index],
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]))))
                    ],
                  ),
                ))));
  }
}
