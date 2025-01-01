// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.lightGreenAccent,
//         body: Center(
//           child: UserCardList(),
//         ),
//       ),
//     );
//   }
// }
//
// class UserCardList extends StatelessWidget {
//   final List<Map<String, String>> users = [
//     {'name': 'Andre Jones', 'initials': 'AJ', 'user': 'Proactive', 'code': 'ANDPRK3', 'signups1': '12', 'signups2': '9', 'signups3': '4'},
//     {'name': 'Jane Doe', 'initials': 'JD', 'user': 'Active', 'code': 'JND1234', 'signups1': '8', 'signups2': '5', 'signups3': '2'},
//     {'name': 'John Smith', 'initials': 'JS', 'user': 'Superuser', 'code': 'JSMITH1', 'signups1': '15', 'signups2': '10', 'signups3': '6'},
//     // Add more user data here
//   ];
//
//   const UserCardList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(5.0),
//       itemCount: users.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: UserCard(
//             name: users[index]['name']!,
//             initials: users[index]['initials']!,
//             userType: users[index]['user']!,
//             shareCode: users[index]['code']!,
//             signups1: users[index]['signups1']!,
//             signups2: users[index]['signups2']!,
//             signups3: users[index]['signups3']!,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class UserCard extends StatelessWidget {
//   final String name;
//   final String initials;
//   final String userType;
//   final String shareCode;
//   final String signups1;
//   final String signups2;
//   final String signups3;
//
//   const UserCard({super.key,
//     required this.name,
//     required this.initials,
//     required this.userType,
//     required this.shareCode,
//     required this.signups1,
//     required this.signups2,
//     required this.signups3,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity
//       ,
//       decoration: BoxDecoration(
//         color: Colors.teal,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.red,
//                   child: Text(
//                     initials,
//                     style: const TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'User: $userType',
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Text(
//                       'Share Code: $shareCode',
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 const Icon(
//                   Icons.close,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             color: Colors.tealAccent.shade700,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         signups1,
//                         style: const TextStyle(
//                           color: Colors.teal,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Text(
//                         'Referred Signups',
//                         style: TextStyle(
//                           color: Colors.teal,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         signups2,
//                         style: const TextStyle(
//                           color: Colors.teal,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Text(
//                         'Referred Signups',
//                         style: TextStyle(
//                           color: Colors.teal,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         signups3,
//                         style: const TextStyle(
//                           color: Colors.teal,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const Text(
//                         'Referred Signups',
//                         style: TextStyle(
//                           color: Colors.teal,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }