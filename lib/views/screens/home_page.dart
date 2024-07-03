import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uyishi_65/services/firebase_auth_service.dart';
import 'package:uyishi_65/views/screens/room_page.dart';
import 'package:uyishi_65/views/widgets/product_count.dart';
import 'package:uyishi_65/views/widgets/product_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final List<Map<String, String>> _pageViewList = [
    {
      "title": "Living Room",
      "image":
          "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
    },
    {
      "title": "Oziq ovqat maxsulodlari",
      "image":
          "https://bogatyr.club/uploads/posts/2023-02/1677348585_bogatyr-club-p-viveska-produkti-fon-pinterest-5.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        

        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: _pickImage,
          ),
        ),

        actions: [
          Icon(CupertinoIcons.bell),
          Gap(10),
          Icon(CupertinoIcons.search),
          Gap(10),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/person.png"),
          ),
          Gap(10),
          IconButton(
            onPressed: () {
              final firebaseAuth = FirebaseAuthService();
              firebaseAuth.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff6D8D54),
        onPressed: () {},
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCarousel(),
                const Gap(20),
                _buildCategoryBar(),
                const Gap(10),
                const ProductCount(),
                const Gap(10),
                const ProductGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: 175,
      child: CarouselSlider.builder(
        itemCount: _pageViewList.length,
        itemBuilder: (context, index, realIdx) {
          final item = _pageViewList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomPage(
                    image: item['image']!,
                    title: item['title']!,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: .8,
          enableInfiniteScroll: true,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            _currentIndexNotifier.value = index;
          },
        ),
      ),
    );
  }

  Widget _buildCategoryBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryBarItem(title: 'Popular', isActive: true),
          CategoryBarItem(title: 'New'),
          CategoryBarItem(title: 'Best Selling'),
          CategoryBarItem(title: 'Featured'),
        ],
      ),
    );
  }
}

class CategoryBarItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const CategoryBarItem({
    super.key,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        color: isActive ? Color.fromARGB(255, 7, 1, 182) : Colors.grey,
      ),
    );
  }
}
