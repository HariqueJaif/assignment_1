import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: ListView(
        children: const [
          BookCard(
            imageUrl: 'https://m.media-amazon.com/images/I/41hnl4MN0pL._SY342_.jpg',
            bookName: 'Himu Samagra Part -1',
            authorName: 'Humayun Ahmed',
            rating: 4.6,
            price: 250.0,
            description: '"Himu Samagra Part -1\" by Humayun Ahmed is a captivating collection featuring the eccentric character Himu. Filled with humor and philosophy, the stories delve into Himu\'s unconventional adventures, offering a delightful and engaging literary experience.',
          ),
          BookCard(
            imageUrl: 'https://m.media-amazon.com/images/I/41jvHRaP3ZL._SY445_SX342_.jpg',
            bookName: 'Shonkhonil Karagar',
            authorName: 'Humayun Ahmed',
            rating: 4.5,
            price: 260.0,
            description: 'Shonkhonil Karagar is a 1973 novel in Bengali by Bangladeshi author Humayun Ahmed. It is also a book that was made into a popular movie in Bangladesh. The book was made into the 1992 film with the same title, starring Zafar Iqbal, Champa, Doli Johur, Abul Hayat, Suborna Mustafa and Asaduzzaman Noor. It was filmed in 1992 in Dhaka, Bangladesh.' ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String bookName;
  final String authorName;
  final double rating;
  final double price;
  final String description;

  const BookCard({
    Key? key,
    required this.imageUrl,
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        title: Text(bookName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(authorName),
            Text('Rating: $rating'),
          ],
        ),
        trailing: ElevatedButton.icon(
          onPressed: () {
            // Navigate to the Buy Now page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyNowPage(
                  bookName: bookName,
                  imageUrl: imageUrl,
                  authorName: authorName,
                  price: price,
                  description: description,
                ),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Buy Now'),
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String imageUrl;
  final String authorName;
  final double price;
  final String description;

  const BuyNowPage({
    Key? key,
    required this.bookName,
    required this.imageUrl,
    required this.authorName,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bookName, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            Image.network(
              imageUrl,
              width: 200.0,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            Text('Author: $authorName'),
            Text(description),
            Text('Price: \$BDT $price'),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              items: ['Bkash', 'Nagad', 'Cash on Delivery']
                  .map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              })
                  .toList(),
              onChanged: (String? value) {
                // Handle dropdown item selection
              },
              hint: const Text('Select an option'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the first page
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
