import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Future<Map<String, dynamic>> getData() async {
    var url = "http://192.168.29.160:8000/api/v1/level-2/parent/new-child/";

    // Your Bearer token
    String token = "your_bearer_token_here";

    // Setting up headers with the token
    var headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Directly decode JSON response
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 247, 241, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(153, 150, 146, 146),
        leading: const Padding(
          padding:  EdgeInsets.only(top: 15),
          child: Text(
            " Cancel",
            style: TextStyle(color:  Color.fromARGB(255, 184, 61, 122)),
          ),
        ),
        title: const Center(
            child: Text(
          "Edit Discovered",
          style: TextStyle(fontWeight: FontWeight.w600),
        )),
        actions: const [
          Text(" Done",
              style: TextStyle(color:  Color.fromARGB(255, 184, 61, 122)))
        ],
      ),
      body: Stack(
        children:[ Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color:  Color.fromARGB(197, 255, 255, 255),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 40,color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: const Border.fromBorderSide(BorderSide(
                              color:  Color.fromARGB(255, 184, 61, 122),
                              width: 1.5))),
                      child: const Center(
                          child: Text(
                        "Select All",
                        style: TextStyle(
                            color:  Color.fromARGB(255, 184, 61, 122),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      )),
                    ),
                    const Text(
                      " Delete",
                      style: TextStyle(
                          color:  Color.fromARGB(255, 184, 61, 122)),
                    ),
                    const Text(
                      " Remember",
                      style: TextStyle(
                          color:  Color.fromARGB(255, 184, 61, 122)),
                    )
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                        color:  Color.fromARGB(255, 184, 61, 122),
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  Text(
                    " Contacts Selected",
                    style: TextStyle(
                        color:  Color.fromARGB(255, 33, 104, 185),
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  )
                ],
              ),
        
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                        
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5,),
                          CircleAvatar(
                                               backgroundColor: Colors.grey[300],
                                               radius: 20,
                                             ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                               backgroundColor: Colors.grey[300],
                                               radius: 24,
                                             ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text("Demo Name",style: TextStyle(fontWeight:FontWeight.w600,fontSize: 19),),
                               Text(
                         "MIAMI,FL.TODAY,11:46 AM",
                         style:
                             TextStyle(color:  Color.fromARGB(255, 184, 61, 122),fontSize: 13,fontWeight: FontWeight.w500),
                       ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                  
                         const Column(
                           children: [
                             Icon(Icons.colorize,size: 17,),
                           ],
                         )
                          
                        ],
                      ),
                    ),
                  );
                  },
                   
                ),
              )
              // ListTile(
              //     title: Text("Nameeeeeee",style: TextStyle(fontWeight:FontWeight.w600,fontSize: 21),),
              //     leading: CircleAvatar(
              //       backgroundColor: Colors.grey[300],
              //     ),
              //     subtitle: Text(
              //       "MIAMI,FL.TODAY,11:46 AM",
              //       style:
              //           TextStyle(color: const Color.fromARGB(255, 184, 61, 122),fontSize: 16,fontWeight: FontWeight.w500),
              //     ),
              //     trailing: Icon(Icons.colorize),
        
              //     )
        
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/icons8-hotspot-99.png",color: const Color.fromARGB(255, 207, 57, 107),)),
                      const Column( crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text("DISCOVERY",style:TextStyle(color: Colors.white),),
                          Text("ON",style:TextStyle(color:  Color.fromARGB(255, 207, 57, 107),)),
                        ],
                      ),
                      
                
                      
                  ],
                ),
                 Row(
                  children: [
                  
                      const Column( crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text("DISCOVERY",style:TextStyle(color: Colors.white),),
                          Text("ON",style:TextStyle(color:  Color.fromARGB(255, 207, 57, 107),)),
                        ],
                      ),
                        SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/icons8-hotspot-99.png",color: const Color.fromARGB(255, 207, 57, 107),)),
                      
                
                      
                  ],
                ),
              ],
            ),
          ),
        )
        ]
      ),
    
    );
    
  }
}
