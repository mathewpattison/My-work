    final Widget container=
    Container(
      width: screen_width*0.4,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFA4F7CF),
        borderRadius: BorderRadius.circular(30)
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.location_on_rounded),
          SizedBox(width: screen_width*0.01,),
          Expanded(child: Text("Location", style: TextStyle(overflow: TextOverflow.ellipsis),))
        ],
      ),
    );

    return 
      Scaffold(
          backgroundColor: Colors.white12,
          appBar: AppBar(
            // shadowColor: ,
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight:  screen_height*0.07,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text("Title",style: TextStyle(color: Colors.black38)),
               
            actions: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 100),
                opacity: scrollOffset>=100?1.0:0.0, // faded 1.0:0.0 and scroll controller height 
                  child: container
              ),
              Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(right: screen_width*0.04),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue
                  ),
                  child: Icon(Icons.qr_code_rounded),
              ),
            ],
          ),
          body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: scrollController,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                children: [
                  Align(
                  alignment: Alignment.centerRight, // cross end in cloumn 
                  child: container,
                ),
                Column(
                  children: List.generate(8, (index){
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      height: screen_height*0.2,
                      width: screen_height,
                      decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)
                  ),
                    );
                  }),
                )
                ],
              ),
            ),
          ),
