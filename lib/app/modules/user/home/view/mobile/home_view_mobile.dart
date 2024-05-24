import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.fastfood),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for restaurants, dishes...',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.location_on),
            Icon(Icons.person),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPromotionsCarousel(),
            _buildCategorySection(),
            _buildFeaturedRestaurants(),
            _buildPopularCuisines(),
            _buildRecommendations(),
            _buildDeliveryOffers(),
            _buildDineInOptions(),
            _buildTakeawayOptions(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: AppLocalizations.of(context)!.helloWorld),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildPromotionsCarousel() {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(child: Text('Promotion $i')),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCategorySection() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryItem(Icons.near_me, 'Nearby'),
              _buildCategoryItem(Icons.star, 'Popular'),
              _buildCategoryItem(Icons.trending_up, 'Trending'),
              _buildCategoryItem(Icons.new_releases, 'New Arrivals'),
              _buildCategoryItem(Icons.thumb_up, 'Top Rated'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(label),
      ],
    );
  }

  Widget _buildFeaturedRestaurants() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Featured Restaurants', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return _buildRestaurantCard('Restaurant $index');
              }),
            ),
          ),
          TextButton(onPressed: () {}, child: Text('See All'))
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(String name) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        child: Column(
          children: [
            Image.network('https://via.placeholder.com/150'),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularCuisines() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Cuisines', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return _buildCuisineCard('Cuisine $index');
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCuisineCard(String name) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Image.network('https://via.placeholder.com/100'),
          Text(name),
        ],
      ),
    );
  }

  Widget _buildRecommendations() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended for You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return _buildRecommendationCard('Recommendation $index');
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(String name) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        child: Column(
          children: [
            Image.network('https://via.placeholder.com/150'),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryOffers() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Food Delivery Offers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return _buildOfferCard('Offer $index');
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard(String name) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        child: Column(
          children: [
            Image.network('https://via.placeholder.com/150'),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDineInOptions() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dine-in Options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return _buildRestaurantCard('Dine-in $index');
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTakeawayOptions() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Takeaway Options', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return _buildRestaurantCard('Takeaway $index');
              }),
            ),
          ),
        ],
      ),
    );
  }
}
