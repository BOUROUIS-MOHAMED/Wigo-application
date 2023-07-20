import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wigo/screens/Settings/setting_main_page.dart';
import 'package:wigo/utils/colors.dart';


class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsMainPage(),));
            },
              child: Icon(Icons.chevron_left,color: AppColors.mainColor,)),
          title: Text('About Us'),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [

              //Name and Logo
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'WIGO',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 8),
                    Image.asset(
                      'assets/logo/2.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),

              //brief summary
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'description',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
              ),

              //statement and values
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mission Statement:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Our mission is to provide high-quality products and services to our users by our partners .',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Values:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('users satisfaction is our top priority'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('We strive for continuous improvement'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('We try to give the user what he need'),
                      ),
                    ],
                  )
              ),

              //History and background
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'History:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Founded in 2023 by Mohamed'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Started as a small application '),
                      ),

                    ],
                  )
              ),

              //products or service
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Products:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text(' High-quality and durable products by our partners'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('low price products'),
                      ),

                    ],
                  )
              ),



              //contact information
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('3220 tataouine sud'),
                        subtitle: Text('Tunisia'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('+216 12 345 678'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('wigo.support.team@gmail.com'),
                      ),
                    ],
                  )
              ),

              //social media
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Follow Us:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Facebook'),
                        onTap: () => launchUrl(Uri.parse('https://www.facebook.com/wigo')),
                      ),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Twitter'),
                        onTap: () => launchUrl(Uri.parse('https://www.twitter.com/wigo')),
                      ),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Instagram'),
                        onTap: () => launchUrl(Uri.parse('https://www.instagram.com/wigo')),
                      ),
                    ],
                  )
              ),


            ],
          ),
        )

    );
  }
}

class Testimonial {
  final String author;
  final String text;

  Testimonial(this.author, this.text);
}