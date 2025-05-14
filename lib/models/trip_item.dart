import 'package:flutter/material.dart';

class TripItem {
  final String id;
  final String title;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final int nights;
  final String status;
  final int unfinishedTasks;
  final List<AssignedUser> assignedUsers;

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.nights,
    required this.status,
    required this.unfinishedTasks,
    required this.assignedUsers,
  });

  // Sample data generator
  static List<TripItem> getSampleItems() {
    return [
      TripItem(
        id: '1',
        title: 'Bali Beach Retreat',
        imageUrl: 'assets/images/palm_trees.jpg',
        startDate: DateTime(2024, 6, 15),
        endDate: DateTime(2024, 6, 22),
        nights: 7,
        status: 'Pending Approval',
        unfinishedTasks: 4,
        assignedUsers: [
          AssignedUser('Sophia',
              'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Ava',
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D'),
          AssignedUser('Ethan',
              'https://plus.unsplash.com/premium_photo-1669879825881-6d4e4bde67d5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
        ],
      ),
      TripItem(
        id: '2',
        title: 'New York City Business Conference',
        imageUrl: 'assets/images/city_skyline.jpg',
        startDate: DateTime(2024, 7, 10),
        endDate: DateTime(2024, 7, 15),
        nights: 5,
        status: 'Confirmed',
        unfinishedTasks: 2,
        assignedUsers: [
          AssignedUser('Sophia',
              'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Noah',
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
        ],
      ),
      TripItem(
        id: '3',
        title: 'Maldives Luxury Vacation',
        imageUrl: 'assets/images/palm_trees.jpg',
        startDate: DateTime(2024, 8, 5),
        endDate: DateTime(2024, 8, 15),
        nights: 10,
        status: 'Pending Approval',
        unfinishedTasks: 6,
        assignedUsers: [
          AssignedUser('Sophia',
              'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Noah',
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Ava',
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D'),
          AssignedUser('Ethan',
              'https://plus.unsplash.com/premium_photo-1669879825881-6d4e4bde67d5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
        ],
      ),
      TripItem(
        id: '4',
        title: 'California Coast Road Trip',
        imageUrl: 'assets/images/pier.jpg',
        startDate: DateTime(2024, 9, 3),
        endDate: DateTime(2024, 9, 10),
        nights: 7,
        status: 'In Progress',
        unfinishedTasks: 3,
        assignedUsers: [
          AssignedUser('Noah',
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Ava',
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D'),
          AssignedUser('Ethan',
              'https://plus.unsplash.com/premium_photo-1669879825881-6d4e4bde67d5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
        ],
      ),
      TripItem(
        id: '5',
        title: 'Thailand Adventure Tour',
        imageUrl: 'assets/images/palm_trees.jpg',
        startDate: DateTime(2024, 10, 12),
        endDate: DateTime(2024, 10, 22),
        nights: 10,
        status: 'Confirmed',
        unfinishedTasks: 5,
        assignedUsers: [
          AssignedUser('Sophia',
              'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Noah',
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Ava',
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D'),
          AssignedUser('Ethan',
              'https://plus.unsplash.com/premium_photo-1669879825881-6d4e4bde67d5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
        ],
      ),
      TripItem(
        id: '6',
        title: 'Tokyo Business Trip',
        imageUrl: 'assets/images/city_skyline.jpg',
        startDate: DateTime(2024, 11, 8),
        endDate: DateTime(2024, 11, 15),
        nights: 7,
        status: 'Pending Approval',
        unfinishedTasks: 8,
        assignedUsers: [
          AssignedUser('Sophia',
              'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Noah',
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
          AssignedUser('Ava',
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D'),
          AssignedUser('Ethan',
              'https://plus.unsplash.com/premium_photo-1669879825881-6d4e4bde67d5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww'),
        ],
      ),
    ];
  }
}

class AssignedUser {
  final String name;
  final String profileImageUrl;

  AssignedUser(this.name, this.profileImageUrl);
}
