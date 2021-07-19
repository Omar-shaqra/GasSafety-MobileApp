import 'package:flutter/material.dart';

import 'contact.dart';

class navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('smart gas and oil '),
          accountEmail: Text('gas@mail.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                'images/Logo.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/feat3.jpg'),fit: BoxFit.cover,
            )
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
          ),
          title: Text('home',style: TextStyle(
            color: Colors.blue
          ),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return contact();
            }));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.payment,
          ),
          title: Text('pay pill',style: TextStyle(

          ),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return contact();
            }
            )
            );
          },
        ),
        ListTile(
          leading: Icon(
            Icons.date_range,
          ),
          title: Text('schedule a service',style: TextStyle(

          ),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return contact();
            }));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.contact_support,
          ),
          title: Text('contact us',style: TextStyle(

          ),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return contact();
            }));
          },

        ),
        ListTile(
          leading: Icon(
            Icons.add_location,
          ),
          title: Text('our community',style: TextStyle(

          ),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return contact();
            }));
          },
        ),
        ListTile(

          title: Text('about us',style: TextStyle(

          ),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return contact();
            }));
          },
        ),
      ],
    ));
  }
}
