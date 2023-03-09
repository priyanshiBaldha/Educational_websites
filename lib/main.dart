import 'package:flutter/material.dart';
import 'Model/Model.dart';
import 'Views/screens/techweb.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homepage(),
        'web': (context) => techWebPage(),
      },
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational websites',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 30),),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'web',
                    arguments: 'https://www.wikipedia.org');
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzYZiMTbSo61rCwUVzjGJr0DdIE2v1g-Q6TwCtm_BWUFgJ0svZowEO5qC9MBRTIdVObXI&usqp=CAU'),
                              fit: BoxFit.contain,),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text('WikiPedia',style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'web',
                    arguments: 'https://www.w3schools.com/',);
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage('https://yt3.ggpht.com/dW6to0x5Crmeh7yi-YPLcQRqVrBtx2BSh8eoKTJbE8NbjloQ0sqlmdszIlxokJU_97-ndOt_=s900-c-k-c0x00ffffff-no-rj'),
                              fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Text('W3 School',style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'web',
                    arguments: 'https://www.javatpoint.com/');
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoOfQkpsWCrJEiDK8cHp_KZ4nVsLhmtyTeJ02dntDU5wOZYUPxXBwZNmaz6AC7yz0_KDk&usqp=CAU'),
                              fit: BoxFit.cover)
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text('Java T Point',style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal),)

                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'web',
                    arguments: 'https://www.tutorialspoint.com/');
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage('https://play-lh.googleusercontent.com/yMRxRJJqn5uk3Gg0V7s4u6gwJFXrEXubxyfg2hjt72dBZE8be592Cndh5cQ9LBPTpiQ'),
                              fit: BoxFit.cover)
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text('Tutorial Point',style: TextStyle(fontSize: 22,fontWeight: FontWeight.normal),)

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Center(
                  child: Text('Bookmark List'),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                content: SizedBox(
                  height: 500,
                  width: 400,
                  child: ListView.builder(
                    itemCount: Modal.myBookMark.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.link_outlined),
                        title: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'web', arguments: '${Modal.myBookMark[index]}');
                          },
                          child: Text('${Modal.myBookMark[index]}'),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              Modal.myBookMark.removeAt(index);
                              Navigator.pop(context);
                            });
                          },
                          icon: Icon(Icons.delete_outline),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.book_outlined),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}