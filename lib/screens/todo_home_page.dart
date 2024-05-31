import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Hi",
                        style: themedata.textTheme.displayMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Asma",
                        style: themedata.textTheme.displayMedium,
                      )
                    ],
                  ),
                ),
                const CircleAvatar(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Your To-Dos",
              style: themedata.textTheme.displayMedium,
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5.0,
                      color: themedata.scaffoldBackgroundColor,
                      
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "Complete the Assignment before 10am tommorow",
                          style: themedata.textTheme.displaySmall,
                        ),
                        subtitle: Text(
                          "Todo one",
                          style: themedata.textTheme.displaySmall,
                        ),
                        trailing: Container(width: 100,child: Row(children: [IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.teal,)),IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red,))],)),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.pushNamed(context, '/addtask');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
