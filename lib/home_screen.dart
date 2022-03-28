import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/report.dart';

/// i create a home screen as statefullwidget
/// now we will create a model
/// step 3 now call the api
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Report> report = [];
  @override
  void initState() {
    /// call load function in init
    load();
    super.initState();
  }

  load() async {
    try {
      final response =
          await Dio().get('https://api.spaceflightnewsapi.net/v3/reports');
      // here we need to map this response into list;
      List<Report> list =
          (response.data as List).map((e) => Report.fromJson(e)).toList();
      // set this list
      setState(() {
        report = list;
      });
    } catch (e) {
      print(e);
    }

    /// it may also generate error so for that we will use try catch
    /// now run app
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: report.isNotEmpty
            ? ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              /// here is set title
                              report[index].title!,
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                          ),

                          /// here image
                          Image.network(report[index].imageUrl!),

                          /// and here summery
                          /// after refresh we got data..
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(report[index].summary!),
                          ),
                        ],
                      ),
                    ),
                  );

                  /// build UI
                },
                itemCount: report.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}

/// so thanks for watching, please share and subscribe me
