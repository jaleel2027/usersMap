import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        title: Text("Google Maps",),),

      body: Stack(
        children: [
          _googleMaps(context),
          _buildContainer(context),
        ],
      ),
    );
  }

  Widget _googleMaps(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
              target:LatLng(23.259933, 77.412613),
              zoom: 6,),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete();
        },
        markers: {
          userOneMarker,userTwoMarker,userThreeMarker
        },
      ),
    );
  }

  Widget _buildContainer(BuildContext context){
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 170,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 5,),
            Padding(
                padding: EdgeInsets.all(10),
            child: _boxes("name : Aryush","email : aryush@gmail.com",
                 22.973423,
                78.656891),
            ),
            SizedBox(width: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: _boxes("name : Rita","email : rita@gmail.com",
                  22.962267,76.050797, ),
            ),
            SizedBox(width: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: _boxes("name : Sita","email : sita@gmail.com",
                  22.719568, 75.857727),
            ),
            SizedBox(width: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: _boxes("name : Shyam","email : shyam@gmail.com",
                  22.719568,
                  75.857727,)
            ),
          ],
        ),
      ),
    );
  }

}

Marker userOneMarker=Marker(
    markerId: MarkerId('user1'),
    position: LatLng(22.973423, 78.656891),
    infoWindow: InfoWindow(
      title: "Aryush",),
      icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange)
);

Marker userTwoMarker=Marker(
    markerId: MarkerId('user2'),
    position: LatLng(22.962267,78.656891),
    infoWindow: InfoWindow(
      title: "Rita",),
    icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange)
);

Marker userThreeMarker=Marker(
    markerId: MarkerId('user3'),
    position: LatLng(22.719568,75.857727),
    infoWindow: InfoWindow(
      title: "Sita",),
    icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueOrange)
);

Future<void> _goToLocation(double lat, double long) async{

  var _controller;
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target:LatLng(lat,long))));
}

Widget _boxes(String _name, String _email, double lat, double long ){
  return GestureDetector(
    onTap: (){
      _goToLocation(lat,long);
      },
    child: Container(
      child: new FittedBox(
        child: Material(
          color: Colors.blue,
          elevation: 10,
          borderRadius: BorderRadius.circular(24),
          shadowColor: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 180,
                height: 200,
              ),
              Container(
                child: Padding(
                    padding:EdgeInsets.all(8),
                  child: myDetailsContainer( _name),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget myDetailsContainer( String _name){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
          padding: EdgeInsets.only(left: 8),
      child: Container(
        child: Text(_name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),),
      SizedBox(height: 5,),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("email"),
            )
          ],
        ),
      )
    ],
  );
}