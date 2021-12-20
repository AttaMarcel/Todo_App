

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class CreateTodoView extends StatefulWidget {
  const CreateTodoView({ Key? key }) : super(key: key);

  @override
  _CreateTodoViewState createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final TextEditingController _titlecontroller=TextEditingController();
  final TextEditingController _desccontroller=TextEditingController();
  final TextEditingController _datecontroller=TextEditingController();
  final TextEditingController _timecontroller=TextEditingController();

  final GlobalKey _formKey=GlobalKey();
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create a Todo'),
        backgroundColor: Colors.white60,
        ),
        body: Form(
         key: _formKey, 
          child: ListView(
            padding: EdgeInsets.all(15),
children: [
 TextFormField(
   onTap: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value)=>setState((){
     _timecontroller.text=value!.format(context);
   })),
  controller: _titlecontroller, 
   decoration:const InputDecoration(
    
     labelText: 'Title',
     labelStyle: TextStyle(fontWeight:FontWeight.bold),
     hintText: 'please enter a title',
hintStyle: TextStyle(color: Colors.green), ),
   keyboardType:TextInputType.text,
   validator: (value) {
     if(value!.isEmpty ){
       return"Please enter a title";
     }
   },
 ), 
 SizedBox(height:10),
 TextFormField(
   controller: _desccontroller,
  decoration:const InputDecoration(
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    hintText: 'please describe your task'
  ), 
  keyboardType: TextInputType.multiline,
  validator: (value) {
    if(value!.isEmpty){
     return'Please enter a discription';
    }
  },
 ),SizedBox(height:10),
 TextFormField(
   onTap:()=> showDatePicker(
     context: context,
    initialDate: DateTime.now(),
     firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days:365))).then((value){setState(() {
        _datecontroller.text=DateFormat.yMMMd().format(value!);
      });
      }),
   controller:_datecontroller,
   decoration: const InputDecoration(
     labelText: 'Date',
     labelStyle: TextStyle(fontWeight: FontWeight.bold),
     hintText: 'please enter a date',
   ),
   keyboardType: TextInputType.datetime,
   validator: (value) {
     if(value!.isEmpty){

       return'please select a date';
     }
     else if(value == DateFormat.yMMMd().format(DateTime.now()) &&_timecontroller.text ==TimeOfDay.now(context).){
return'Hello this is a trial';
     }
   },
  ),
  SizedBox(height: 10),
  TextFormField(
    controller: _timecontroller,
  ),
  TextButton(
    onPressed: (){},

    child: const Text(
      'create',
      style: TextStyle(fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,backgroundColor: Colors.green,
      ),
       
  ),

],
      ),
      )),
  
  );
  }}