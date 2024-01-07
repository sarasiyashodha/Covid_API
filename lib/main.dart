import 'package:covid_api/models/covid_data_model.dart';
import 'package:covid_api/services/api_service.dart';
import 'package:flutter/material.dart';

import 'components/custom_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: service.getData(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            CovidDataModel data = snapshot.data!;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu),
                        Text('Covid 19',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Icon(Icons.add_location)

                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainer(
                          size: size, title: 'Total Deaths', color: Colors.red, value: data.totalDeaths!,),
                        CustomContainer(size: size, title: 'Total Recovered', value: data.totalRecovered!, color: Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainer(
                          size: size, title: 'Active cases', color: Colors.blue, value: data.activeCases!,),
                        CustomContainer(size: size, title: 'Total Cases', value: data.totalCases!, color: Colors.amber.shade800)
                      ],
                    )


                  ],
                ),
              ),
            );

          }
          return Center(
            child: CircularProgressIndicator(),
          );

        },
      )
    );
  }
}

