import 'package:cook_smart/Pages/MainPage.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(),
      ),
      // GoRoute(
      //   path: '/recipe/:id',
      //   builder: (context, state) {
      //     final id = state.pathParameters['id'];
      //     return RecipeDetailPage(recipeId: id!);
      //   },
      // ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Placeholder();
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Halo Ryo\nMau masak apa hari ini?', style: TextStyle(fontSize: 18)),
//         backgroundColor: Colors.orange,
//         actions: const [
//           CircleAvatar(
//             backgroundImage: NetworkImage('https://images.unsplash.com/photo-1617825013838-0c4109a96aca?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',), // Avatar placeholder
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Cari resep',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Resep berdasarkan bahan',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 100,
//                 color: Colors.orange[100],
//                 child: Center(child: Text('Tampilkan lebih banyak')),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Rekomendasi untuk anda',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 4 / 3,
//                 ),
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       context.go('/recipe/$index');
//                     },
//                     child: Card(
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Image.network(
//                               'https://images.unsplash.com/photo-1617825013838-0c4109a96aca?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               'Farfalle with Peas, Ham and Cream',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Sedang Populer',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 4 / 3,
//                 ),
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: Image.network(
//                             'https://images.unsplash.com/photo-1617825013838-0c4109a96aca?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Farfalle with Peas, Ham and Cream',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 12),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark, color: primaryColor),
//             label: 'Resep disimpan',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Daftar belanja',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Rencana makan',
//           ),
//         ],
//         selectedItemColor: Colors.orange,
//       ),
//     );
//   }
// }

// class RecipeDetailPage extends StatelessWidget {
//   final String recipeId;

//   const RecipeDetailPage({required this.recipeId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Resep'),
//       ),
//       body: Center(
//         child: Text('Detail dari resep dengan ID: $recipeId'),
//       ),
//     );
//   }
// }