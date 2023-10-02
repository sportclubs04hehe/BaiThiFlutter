  import 'package:flutter/material.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Travel App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      );
    }
  }

  class MyHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(118, 94, 216, 1), // Thay đổi màu nền cho AppBar
          elevation: 0, // Loại bỏ đổ bóng
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Guy!',
                style: TextStyle(
                  fontSize: 20, // Kích thước font chữ
                  fontWeight: FontWeight.bold, // Độ đậm
                ),
              ),
              Text('Where are you going next?'),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60), // Đặt kích thước ưu tiên cho ô tìm kiếm
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search your destination',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange[300],
                      minimumSize: Size(110, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.hotel),
                    label: Text('Hotels'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[300],
                      minimumSize: Size(110, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.flight),
                    label: Text('Flights'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[300],
                      minimumSize: Size(110, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.all_inclusive),
                    label: Text('All'),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text('Popular Destinations',style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    _buildDestinationCard('Hoi An', 'assets/hoian1.jpg'),
                    _buildDestinationCard('Sai Gon', 'assets/saigon.jpg'),
                    _buildDestinationCard('Ha Giang', 'assets/hagiang.jpg'),
                    _buildDestinationCard('Ba Na Hills', 'assets/ba-na-hills.jpg'),
                    _buildDestinationCard('Ba Na Hills', 'assets/hanoi.jpg'),
                    _buildDestinationCard('Ba Na Hills', 'assets/nhatrang.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Loại fixed cho phép hiển thị nhiều hơn 3 mục
          backgroundColor: Colors.white, // Màu nền
          selectedItemColor: Colors.blue, // Màu của mục đã chọn
          unselectedItemColor: Colors.grey, // Màu của mục chưa được chọn
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Work',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Properties',
            ),
          ],
        ),
      );
    }

    Widget _buildDestinationCard(String title, String imagePath) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
