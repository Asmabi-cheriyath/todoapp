import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{

  String?id;
  String?title;
  String?body;
  int?status;
  DateTime?createdAt;

  TaskModel({this.id,this.title,this.body,this.status,this.createdAt});

  factory TaskModel.fromJson(DocumentSnapshot json){

    return TaskModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdAt: json['createdAt'],
      status: json['status']
    );
  }

  Map<String,dynamic>toMap(){
    return{
      'id':id,
      'title':title,
      'body':body,
      'ststus':status,
      'createdAt':createdAt
    };
  }

}