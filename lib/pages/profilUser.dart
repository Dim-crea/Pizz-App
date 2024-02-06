import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilUser extends StatelessWidget {
  const ProfilUser({super.key});


  //overide pour rajouter de la matiere a ma classe
  @override
  Widget build(BuildContext context){ 
    return const Scaffold(
      appBar : AppNavBar(),
      body: const SingleChildScrollView( 
        child: Column(  
        
        ),
      ),
      //bottomNavigationBar: NavigationBarApp(),
    );
  }
}