// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/pizzalist.dart';
import 'package:google_fonts/google_fonts.dart';




const mainColor = Color.fromARGB(255, 255, 255, 255);
const textColor = Color(0xFF457E44);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: "Pizz'App", 
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  //overide pour rajouter de la matiere a ma classe
  @override
  Widget build(BuildContext context){ 
    return const Scaffold(
      appBar : AppNavBar(),
      body: const SingleChildScrollView( 
        child: Column(  
        children: [
          ImgCommande(),
          FastCommande(),
          BestMoments(),
          //NavigBar(),
          ],
        ),
      ),
      //bottomNavigationBar: NavigationBarApp(),
    );
  }
}

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      leading: const IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 30.0,
        ),
        onPressed: null,
      ),
      title: const Text("Pizz'App",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            ),
          ),
          centerTitle: true,
      );
  }
}

class ImgCommande extends StatelessWidget{
  const ImgCommande({super.key});

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          color: Colors.black,
            child: Positioned(
                top: AppBar().preferredSize.height,
                child :Image.asset('assets/images/pizza-fraichement-italienne-tranche-fromage-mozzarella-ia-generative.jpg',
                //fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                ),
            ),
        ),
        Positioned(
           top: 200,
           left: 140,
            child: ElevatedButton(
                onPressed: null,
                //style de ton bouton "changement d'état de blanc a vert"
            
                style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white), // correspond à la couleur du text du bouton
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 197, 197, 197)),// correspond à la couleur du fond du bouton
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), // Bordure arrondie
                  ),
                ),
                ),
                child: const Text("Je commande"),
            ),
            ),
        
      ],
    );
  }
}

class FastCommande extends StatelessWidget{
  const FastCommande({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal:20, vertical:10),
          child: Center(
          child:Text("Achat Rapide",
          //style pour ton text
          ),
          ),
        ), 
        
        SizedBox(
          height: 200,
          child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal:20, vertical:10),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              //redirection d'ouverture d'image
            }, 
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(pizzaList[index].image) ,
                  ),
              ),
            ),
          ), 
          separatorBuilder: (context, index) => const SizedBox(width:10), 
          itemCount: pizzaList.length,
        ),
      ),
      ],
    );
  }
}

class BestMoments extends StatelessWidget{
    const BestMoments({super.key});
  @override
  Widget build(BuildContext context){
    
    return Center(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Padding(padding: EdgeInsets.only(top:10, bottom: 10,),
          child: Center(
            child: Text("Nos Best du moent"),
            //style pour ton text
          ),
        ),
        
        
        Center(
          child: Card( 
                 color:Colors.amber, 

            child: Column(
              mainAxisSize: MainAxisSize.min,//MainAxisSize.min : indique que le widget doit être aussi petit que possible le long de son axe principal.Tout en prennant ses widget enfant
                children: [ 
                  Padding(padding: const EdgeInsets.only(top: 10,),
                   child: Center(
                     child: Image.asset('assets/images/pizzabest.jpeg',
                     fit: BoxFit.cover,
                     
                     ),
                  ),
                ),
                
                const Padding(padding: EdgeInsets.only(top:10, bottom:10),
                  child: Center(
                    child: Text('La Margarita de la MaMa',
                  //espace pour le style du texte
                    ),
                  ),
                ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*class NavigationBarApp extends StatefulWidget{
   const NavigationBarApp({super.key});

   @override
  State <NavigationBarApp> createState() => _NavigBarAppState();  
}*/

/*class _NavigBarAppState extends State<NavigationBarApp> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index){
            setState(() {
              currentPageIndex = index;
            });
          }, 
          indicatorColor: Colors.green,
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),

            NavigationDestination(
              icon: Badge(child: Icon(Icons.person),),
              label: "Profil",
            ),

            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.messenger_sharp),
              ),
              label: 'Messages',
            ),
          ],
        ),
    );
  }
}*/

/*class NavigBar extends StatefulWidget{
    const NavigBar({super.key});

  @override
  Widget build(BuildContext context){
    return const Center(
      
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ElevatedButton(
          //   onPressed:null,
          //   child: Icon(Icons.search), 
          //    style: ElevatedButton.styleFrom(
          //     shape: CircleBorder(),
          //     backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 197, 197, 197)),
          //   child: Text('Mon profil'),
          // ),
        ],
      ),
    );
  }
  

}*/