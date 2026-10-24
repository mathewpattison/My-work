import'package:flutter/material.dart';

class AnimatCon extends StatefulWidget{
  const AnimatCon({super.key});

  @override
  State<AnimatCon>createState()=> _AnimatConState();
}

class _AnimatConState extends State<AnimatCon> {
  
  late ScrollController scrollController;
  bool scroll=false;

  @override
  void initState(){
    super.initState();
    scrollController=ScrollController();
    scrollController.addListener(scrollListener);
  }


  void scrollListener(){
    // scrollOffset=scrollController.offset;
    
    if(scrollController.offset>=10){
       setState(() {
        //  selected=! selected;
        if(!scroll){
         scroll=true;
        }

       });
    }else if (scrollController.offset<=10)  {
      setState(() {
        //  selected=! selected;
        if(scroll){
             scroll=false;
        }
      
       });
    }
  }

//coditions for contoller 'Physics' using scroll controller offset
ScrollPhysics getScrollPhysics() {
  if (!scrollController.hasClients) {
    return ScrollPhysics();
  }

  else if (scrollController.offset >=1000) {
    return BouncingScrollPhysics();
  } 
  else if (scrollController.offset <= 0) {
    return BouncingScrollPhysics();
  } 

  else {
    return ScrollPhysics();
  }
}

@override
void dispose(){
  super.dispose();
  scrollController;
  scrollController.removeListener(scrollListener);

}

  @override
  Widget build(BuildContext context){
    final screen_width= MediaQuery.of(context).size.width;
    final screen_height=MediaQuery.of(context).size.height;
    return 
      Scaffold(
          backgroundColor: Color.fromARGB(255, 236, 235, 235),
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.blue,)),
          ),
   
          body:
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 235, 235)
              ),   
              child:SafeArea(
                child: Stack(
                  children: [
                    Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                          SizedBox(height: screen_height*0.01,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Padding(
                              padding:  EdgeInsets.only(left: screen_width*0.02),
                              child: Row(
                                children: List.generate(3, (index){
                                return
                                  Container(
                                    height: screen_height*0.09,
                                    width: screen_width*0.2,
                                      margin: EdgeInsets.symmetric(horizontal: screen_width*0.02, vertical: screen_height*0.02),
                                    //  margin: EdgeInsets.all(16),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      // border: Border.all(color: Colors.grey),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 2),
                                          color: Colors.black12,
                                          blurRadius: 2
                                        )
                                      ]
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),        
                                
                      ],
                    ),

                      Container(
                      height: screen_height,
                      alignment: Alignment.bottomCenter,
                        child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                        ),
                        height: scroll?screen_height*1.0: screen_height*0.70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          child: CustomScrollView(
                            physics: getScrollPhysics(),
                            controller: scrollController, 
                                slivers:[
                                  //sticky search bar
                                  SliverPersistentHeader(
                                    pinned: true,
                                    delegate: StickyHeader(
                                      height: 130, 
                                      child: Padding(
                                      padding: EdgeInsets.only(top: screen_height*0.00,),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: screen_height*0.01, vertical: screen_height*0.008),
                                                                    
                                          padding: EdgeInsets.all(0.8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFececec),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                         
                                        ),
                                      )
                                    )
                                    
                                  ),
                                  SliverToBoxAdapter(
                                    child: 
                                      Column(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            physics: BouncingScrollPhysics(),
                                            child: Padding(
                                              padding:  EdgeInsets.only(left: screen_width*0.02),
                                              child: Row(
                                                children: List.generate(8, (index){
                                                return
                                                  Container(
                                                    height: screen_height*0.09,
                                                    width: screen_width*0.2,
                                                    margin: EdgeInsets.symmetric(horizontal: screen_width*0.02, vertical: screen_height*0.02),
                                                    padding: EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFececec),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ),      

                                          Padding(
                                          padding: EdgeInsets.only(top: screen_height*0.015),
                                          child: 
                                              Column(
                                              children: List.generate(10, (index){
                                                return Container(
                                                  height: screen_height*0.18,
                                                  width: screen_width*0.96,
                                                  margin: EdgeInsets.only(right: screen_height*0.015,left: screen_height*0.015, bottom:screen_height*0.015),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFececec),
                                                    borderRadius: BorderRadius.circular(12)
                                                  ),
                                                  
                                                );
                                              }),
                                              ),
                                          ),
                                        ],
                                      )
                                  )
                                ]
                              ),
                            ),
                          ),
                      ),
                  ],
                ),
              ),
                    
          ),
    );
  }

}

class StickyHeader extends SliverPersistentHeaderDelegate{
  final double height;
  final Widget child;
  const StickyHeader({required this.height, required this.child});

  @override
  double get maxExtent=>65;

  @override
  double get minExtent=>65;

  @override
  Widget build(BuildContext constext, double shrinkOffset, bool overlapsContents){
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,    
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      
      child: child
    );
  }
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate)=>false;
 }
