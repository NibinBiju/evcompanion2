// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FeedbackProvider extends ChangeNotifier {
//   List<String> feedbackList = [];

//   void addFeedback(String feedback) {
//     feedbackList.add(feedback);
//     notifyListeners();
//   }
// }

// class FeedbackPage extends StatelessWidget {
//   final String userEmail;
//   final TextEditingController _feedbackController = TextEditingController();

//   FeedbackPage({required this.userEmail});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Feedback'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'User Email: $userEmail', // Display user's email
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _feedbackController,
//               decoration: InputDecoration(labelText: 'Enter your feedback'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String feedback = _feedbackController.text;
//                 if (feedback.isNotEmpty) {
//                   Provider.of<FeedbackProvider>(context, listen: false)
//                       .addFeedback("$userEmail: $feedback");
//                   _feedbackController.clear();
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Please enter feedback before submitting.'),
//                     ),
//                   );
//                 }
//               },
//               child: Text('Submit Feedback'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackData {
  final String userEmail;
  final String feedback;

  FeedbackData({required this.userEmail, required this.feedback});
}

class FeedbackProvider extends ChangeNotifier {
  List<FeedbackData> feedbackList = [];

  void addFeedback(String userEmail, String feedback) {
    feedbackList.add(FeedbackData(userEmail: userEmail, feedback: feedback));
    notifyListeners();
  }
}

class FeedbackPage extends StatelessWidget {
  final String userEmail;
  final TextEditingController _feedbackController = TextEditingController();

  FeedbackPage({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User Email: $userEmail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(labelText: 'Enter your feedback'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String feedback = _feedbackController.text;
                if (feedback.isNotEmpty) {
                  Provider.of<FeedbackProvider>(context, listen: false)
                      .addFeedback(userEmail, feedback);
                  _feedbackController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter feedback before submitting.'),
                    ),
                  );
                }
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}