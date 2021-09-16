import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photogallery/picture_detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhotoGalleryApp(),
  ));
}

class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);

  @override
  _PhotoGalleryAppState createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  // Image data source
  List img = [

    "https://images.unsplash.com/photo-1631559865989-12afe87b5b7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3wxNDI1NDAyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1631355900166-e2974bbf2ab7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1592342632531-6f60a2576ab8?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8MTQyNTQwMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1618522761561-f1211c4781dd?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8UzRNS0xBc0JCNzR8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60"
    "https://images.unsplash.com/photo-1544371865-355080021b18?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDl8UzRNS0xBc0JCNzR8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=600]"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text("Photo Gallery App",
              style: TextStyle(
                color: Colors.red,
                fontSize: 32.0,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 18.0),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.purpleAccent,),
                  hintText: "Search for Image",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    )
                ),
              ),
              SizedBox(height: 24.0,),
              Expanded(child: Padding(
               padding: EdgeInsets.symmetric(vertical: 18.0),
                child: StaggeredGridView.countBuilder(
                    crossAxisCount:2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount:img.length,
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context) => PictureDetailScreen(img[index])
                           ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(img[index],fit:BoxFit.fill ,),
                          ),
                        ),
                      );

                    },
                   staggeredTileBuilder: (index){
                      return new StaggeredTile.count(1,index.isEven ? 1.2 :2);
                   }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
