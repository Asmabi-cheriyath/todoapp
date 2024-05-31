import 'package:flutter/material.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController _titleController=TextEditingController();
  TextEditingController _discriptionController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final themedata=Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Add Task",style: themedata.textTheme.displayMedium,),
          SizedBox(height: 5,),
          Divider(height: 2,color: Colors.teal,endIndent: 50,
          ),
          SizedBox(height: 20,),

          TextFormField(
                style: themedata.textTheme.displaySmall,
                controller: _titleController,
               
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title is Mandatory";
                  }
                },
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                    hintText: "Enter Task Title",
                    hintStyle: themedata.textTheme.displaySmall,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(height: 10,),
              TextFormField(
                style: themedata.textTheme.displaySmall,
                controller: _discriptionController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Write the Discription";
                  }
                },
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: themedata.textTheme.displaySmall,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 48,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text("Add Tsak",style: themedata.textTheme.displayMedium,),),
                ),
              ),

            
          
        ],),
      ),
    );
  }
}