import 'package:hive/hive.dart';

class toDodatabase{


  final _mybox = Hive.box('mybox');

   List todolist =[];

   void createinitialdata(){
    todolist =[
      ['make tutorial', false]
    ];
   }

   void loadData(){
    todolist = _mybox.get('Todolist');
   }

   void updateDataBase(){
    _mybox.put('Todolist', todolist);
   }

}