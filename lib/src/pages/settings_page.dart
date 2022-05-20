import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(
              color: Colors.transparent,
              height: 5.0,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    //USER PHOTO SIZE
                    height: 130,
                    width: 130,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.pngkey.com/png/full/52-522921_kathrine-vangen-profile-pic-empty-png.png'),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.camera_alt_outlined),
                    backgroundColor: Colors.black54,
                  )
                ],
              ),
            ),
            _userInfo(),
            Container(
                padding: EdgeInsets.all(20.0), child: _sesionData(context)),
          ],
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      //color: Colors.black12,
      width: double.infinity,
      height: 100.0,
      child: Center(
        child: Column(
          children: [
            Divider(
              color: Colors.transparent,
              height: 15.0,
            ),
            Text('UserName'),
            Text('UserEmailAdress'),
          ],
        ),
      ),
    );
  }

  //SESION DATA
  Widget _sesionData(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      height: 325.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Row(
            //-------
            children: [
              Icon(Icons.computer),
              Text('Dato de la sesion'),
            ],
          ),
          Divider(),
          Text('Datos del Token (authorization)'),
          Divider(color: Colors.transparent, height: 140.0),
          Center(child: _button(context))
        ],
      ),
    );
  }

  //BOTON CLOSE SESION
  Widget _button(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
        child: Text('Cerrar Sesión'),
        style: ElevatedButton.styleFrom(
            primary: Color(0xffba0303),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(16))),
      ),
    );
  }
}//
