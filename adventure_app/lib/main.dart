import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF607D8B),
        primaryColor: Colors.transparent,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What would you like to do today?',
                style: TextStyle(color: Colors.white, fontSize: 24)),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Enter your activity',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFF90A4AE),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Popular discoveries near you',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10),
              buildDiscoveryList(context),
              SizedBox(height: 20),
              Text('Popular Activities',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10),
              buildActivitiesList(context),
              SizedBox(height: 20),
              Text('Your Points',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PointsPage()),
                  );
                },
                child: buildPointsCard(200, 50),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget buildDiscoveryList(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildDiscoveryCard(context, 'Discover Cape Town', '5 Destinations',
              'assets/cape_town.jpg'),
          buildDiscoveryCard(context, 'Discover Joburg', '5 Destinations',
              'assets/joburg.jpg'),
          buildDiscoveryCard(context, 'Discover Kruger', '5 Destinations',
              'assets/kruger.jpg'),
          buildDiscoveryCard(context, 'Discover Durban', '5 Destinations',
              'assets/durban.jpeg'),
          buildDiscoveryCard(context, 'Discover Garden Route', '5 Destinations',
              'assets/garden_route.jpeg'),
        ],
      ),
    );
  }

  Widget buildActivitiesList(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildActivityCard(
              context, 'Hiking', 'Top Trails', 'assets/hiking.webp'),
          buildActivityCard(
              context, 'Surfing', 'Best Spots', 'assets/surfing.jpg'),
          buildActivityCard(context, 'Wine Tasting', 'Famous Wineries',
              'assets/wine_tasting.jpg'),
          buildActivityCard(
              context, 'Safari', 'Wildlife Adventures', 'assets/safari.jpg'),
          buildActivityCard(context, 'Scuba Diving', 'Underwater Experiences',
              'assets/scuba_diving.jpg'),
        ],
      ),
    );
  }

  Widget buildDiscoveryCard(
      BuildContext context, String title, String subtitle, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DiscoveryDetailPage(title: title)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.1)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildActivityCard(
      BuildContext context, String title, String subtitle, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActivityDetailPage(title: title)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.1)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPointsCard(int points, int nextLevel) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF37474F),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Points',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(Icons.star, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(points.toString(),
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          SizedBox(height: 10),
          Text('Next Level in $nextLevel Points',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: points / (points + nextLevel),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              backgroundColor: Colors.grey[300],
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF263238),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FriendsPage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiscoverPage()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PointsPage()),
          );
        } else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Points'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation to about page
            },
          ),
        ],
      ),
    );
  }
}

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/friend1.jpg'),
            ),
            title: Text('John Doe'),
            subtitle: Text('Online'),
            trailing: IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Implement chat functionality
              },
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/friend2.jpg'),
            ),
            title: Text('Jane Smith'),
            subtitle: Text('Offline'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Implement add friend functionality
              },
            ),
          ),
          // Add more friends here
        ],
      ),
    );
  }
}

class PointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Points'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Points: 200', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add redeem points functionality here
              },
              child: Text('Redeem Points'),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('Discover new places and activities here!',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
//dont want t see this again 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("ADVENTURE_PROFILE"),
        centerTitle: true,
        actions: [
         
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // COLUMN THAT WILL CONTAIN THE PROFILE
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage:NetworkImage(
                  "https://www.pexels.com/photo/man-in-black-jacket-771742/",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "USER_NAME",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("POTENTAL_TITLE_")
            ],
          ),
       
         
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(
                            card.icon,
                            size: 30,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            card.title,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text(card.buttonText),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length,
            ),
          ),
          const SizedBox(height: 35),
          ...List.generate(
            customListTiles.length,
            (index) {
              final tile = customListTiles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: ListTile(
                    leading: Icon(tile.icon),
                    title: Text(tile.title),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              );
            },
          )
        ],
      ),
      
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

class DiscoveryDetailPage extends StatelessWidget {
  final String title;

  DiscoveryDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('Details for $title', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ActivityDetailPage extends StatelessWidget {
  final String title;

  ActivityDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('Details for $title', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "View Leaderboads",
    icon: CupertinoIcons.chart_bar,
    buttonText: "View",
  ),
  ProfileCompletionCard(
    title: "Add Some Friends",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Past Activity",
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
  ),
  CustomListTile(
    title: "Logout",
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];