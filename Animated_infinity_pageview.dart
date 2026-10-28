import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:ui'; 

class Animated_PageView extends StatefulWidget{
const Animated_PageView({super.key});

@override
State<Animated_PageView> createState()=> _Animated_PageViewState();
}

class _Animated_PageViewState extends  State<Animated_PageView> {

  final List<String> images=List.generate(6, (index)=>'assets/images/dm${index+1}.jpg');

  late PageController pageController;
  int currentPage=0;

  bool isExpand=false;

  final List<IconData> icons=[Icons.currency_rupee_rounded, Icons.favorite_rounded, Icons.star_rounded];
  final List<String> texts=['100.0', '45', '4.5'];
  final List <Color> colors1=[Color(0xff00bf63),Color(0xFFeb3752),Color(0xffffbd59)];
  final List <Color> colors2=[Color(0xff00bf63),Color(0xFFd65697),Color(0xffffbd59)];



  @override
  void initState(){
    super.initState();
    pageController=PageController(initialPage: images.length*1000, viewportFraction: 0.9);
  }
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context){
    final screen_height= MediaQuery.of(context).size.height;
    final screen_width= MediaQuery.of(context).size.width;
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 450,
            child: PageView.builder(
              controller: pageController,
              itemCount: null,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index){
              final int actualIndex = index % images.length;
              return AnimatedBuilder(
        
                animation: pageController,
                builder: (context, child) {
                  double value = 0;
                    
                  final double currentPages = pageController.hasClients
                  
                  ? pageController.page ?? pageController.initialPage.toDouble()
                  : pageController.initialPage.toDouble();

                  value = ((index - currentPages) * 0.20).clamp(-1.0, 1.0);
                  final smooth=Curves.easeOut.transform(value.abs());

                  final tilt = value < 0 ? -smooth*0.15 : smooth*0.15;
                  // print("value $value index $index");
                  
                  return Transform.rotate(
                    angle: tilt,
                    child: child
                  );
                },

                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40),
                            // image: DecorationImage(image: AssetImage(images[actualIndex]), fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(offset: Offset(0, 4), blurRadius: 1, color: Colors.black26)
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Top continer contents
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Color(0x30FFFFFF),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(width: 1 ,color: Color(0x509B9B9B)),
                                        // gradient: LinearGradient(colors: [ Color.fromARGB(139, 255, 255, 255), 
                                    
                                        // ])
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                padding: EdgeInsets.all(1.0),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1 ,color: Colors.white24),
                                                  color: Color(0x14FFFFFF),
                                                ),
                                                
                                                
                                                child: Icon(Icons.location_on_rounded, color: Color(0xFFaf2036),)),
                                                SizedBox(width: 10,),
                                                Text("Burger Story", 
                                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
                                            ],
                                          ),
                                    
                                          
                                        ],
                                      )),
                                  ),
                                ),

                                //Bottom continer contents
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                        child: Container(
                                        width: 500,
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Color(0x30FFFFFF),
                                          borderRadius: BorderRadius.circular(30),
                                          // 0x509B9B9B
                                          border: Border.all(width: 1 ,color: Color(0x509B9B9B)),
                                          // gradient: LinearGradient(colors: [ Color.fromARGB(139, 255, 255, 255), 
                                        
                                          // ])
                                        ),
                                        child: Column( 
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Center(child: Text("Fried Chicken Cheese Burger", 
                                              style: TextStyle(color: Colors.white, fontSize: 20), 
                                              overflow: isExpand ?TextOverflow.visible:TextOverflow.ellipsis,
                                              maxLines: isExpand ? null:2,
                                              )),
                                            ),
                                          ],
                                        )
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Row(
                                      children: List.generate(3, (index){
                                        return 
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 8,sigmaY: 8),
                                                child: Container(
                                                padding: EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  color: Color(0x30FFFFFF),
                                                  borderRadius: BorderRadius.circular(30),                                                
                                                  border: Border.all(width: 1 ,color: Color(0x509B9B9B)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    // Icons Color Gradient
                                                      ShaderMask(
                                                        blendMode: BlendMode.srcIn,
                                                        shaderCallback: (Rect bounds){
                                                          return ui.Gradient.linear(
                                                            Offset(4.0, 25.0), 
                                                            Offset(25.0, 5.0), 
                                                            [
                                                              colors1[index],
                                                              colors2[index]
                                                            ]
                                                          );
                                                        },
                                                        child: Icon(icons[index], size: 20,)
                                                      ),
                                                    //
                                                    SizedBox(width: 0,),
                                                    Text(texts[index], style: TextStyle(
                                                      fontSize: 15, color: Colors.white
                                                    ),),
                                                  ],
                                                  ),                                                                                            
                                                ),
                                              ),
                                            ),
                                          ),
                                        );                                       
                                      }),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ); 
            }),
          ),
        ],
      ),
    );
  }

}
