import 'package:flutter/material.dart';
import 'package:todo_app/views/TodoDetailView.dart';
import 'package:todo_app/views/create_todo_view.dart';
class HomeView extends StatelessWidget {
  const 
  
HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: InkWell(
          onTap: (){
            showModalBottomSheet(context: context, builder: (context){
              return ListView(
                children: [
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                  CompletedTodoTile(),
                ],
              );
            });
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all( 15),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
              children: [
                Icon(Icons.check_circle_rounded),
                SizedBox(width: 10),
                Text('Completed'),
                SizedBox(width: 10),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
            Text('24')
            ],
          ),

          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context){
              return CreateTodoView();
            }));
          },
          child: const Icon(Icons.add,color:Colors.white),
          ),
        appBar: AppBar(
          leading:const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CircleAvatar(
              foregroundImage: AssetImage("assets/sumaya.jpg"),
            ),
          ) ,
          title:const Text("My Task",style: TextStyle(color: Colors.black),) ,
          foregroundColor: Colors.yellow,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(onPressed:() {}, icon: Icon(Icons.sort,color: Colors.black,)),
            IconButton(onPressed:() {}, icon: Icon(Icons.search, color: Colors.black,)),
          ],
        ),
        body: ListView(
          children: [
            TodoTile(
            title:'Plan trip to Ghana',
           subtitle: 'Take the entire class to Ghana by Nkwanta road'),
           TodoTile(
             title: 'Plan a trip to America',
              subtitle: 'Take the entire class to Ghana by Nkwanta road'),
              TodoTile(
                title: 'Plan a trip to Nigeria', 
              subtitle: 'Take the entire class to Ghana by Nkwanta road'),
             TodoTile(
             title: 'Plan a trip to Germany',
            subtitle: 'Take the entire class to Ghana by Nkwanta road'),
              TodoTile(
                title: 'Plan a trip to England', 
              subtitle: 'Take the entire class to Ghana by Nkwanta road'),
              
          ],
      )));}
}


class TodoTile extends StatelessWidget {
  const TodoTile({
    Key? key,required this.title,required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        Navigator.of(context).push(MaterialPageRoute(builder:(context){
          return DetailView(title: title, subtittle: subtitle) ;
        }));
       },   
      child: Card(
        elevation: 4,
        child:ListTile(
          leading: Icon(Icons.check_circle_outlined),
          title:Text(
            title,
          
          style:const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            maxLines: 3,overflow: TextOverflow.fade,
          ),
          trailing: TextButton.icon(
          onPressed:(){},
           icon:const Icon(Icons.notifications),
            label: const Text('Yesterday')),
        
      )
      )
    );
  }
  }
class CompletedTodoTile extends StatelessWidget {
  const CompletedTodoTile({
    Key? key, }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        Navigator.of(context).push(MaterialPageRoute(builder:(context){
          return DetailView(
            title:'Trip to tamale',
            subtittle: 'This is a completed trip');
        }));
       },   
      child: Card(
        elevation: 4,
        child:ListTile(
          leading: Icon(Icons.check_circle_outlined),
          title:const Text(
            'Trip to Tamale',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'This is a completed trip',
            maxLines: 3,
            overflow: TextOverflow.fade,
          ),
          trailing: TextButton.icon(
          onPressed:(){},
           icon:const Icon(Icons.notifications),
            label: const Text('Yesterday')),
        
      )
      )
    );
  }
}