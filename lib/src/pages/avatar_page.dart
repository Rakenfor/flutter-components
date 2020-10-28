import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.ftru1-1.fna.fbcdn.net/v/t1.0-9/90123892_2634204793479817_1737482745619152896_n.jpg?_nc_cat=109&_nc_sid=85a577&_nc_eui2=AeH5-MCqX7LS6O_1DeeLwZd2aJeY-5JDviBol5j7kkO-IFeLv0wEwJKjwAdN04ITSxAMnkUte5qkkVa-uahGDqq9&_nc_ohc=Xsaul9bZWwgAX_KHDpQ&_nc_ht=scontent.ftru1-1.fna&oh=a9322f989ccfab65f5660ea6b5cd6170&oe=5F3663B8'),
              radius: 21,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('RT'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
            elevation: 2.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: FadeInImage(
                fadeInDuration: Duration(milliseconds: 200),
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://scontent.ftru1-1.fna.fbcdn.net/v/t1.0-9/90123892_2634204793479817_1737482745619152896_n.jpg?_nc_cat=109&_nc_sid=85a577&_nc_eui2=AeH5-MCqX7LS6O_1DeeLwZd2aJeY-5JDviBol5j7kkO-IFeLv0wEwJKjwAdN04ITSxAMnkUte5qkkVa-uahGDqq9&_nc_ohc=Xsaul9bZWwgAX_KHDpQ&_nc_ht=scontent.ftru1-1.fna&oh=a9322f989ccfab65f5660ea6b5cd6170&oe=5F3663B8'))),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
