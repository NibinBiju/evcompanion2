import 'package:evcompanion2/presentation/view/settings_page/fee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class DisplayFeedbackPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Feedback List'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Consumer<FeedbackProvider>(
//           builder: (context, feedbackProvider, child) {
//             List<String> feedbackList = feedbackProvider.feedbackList;
//             return ListView.builder(
//               itemCount: feedbackList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(feedbackList[index]),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
class DisplayFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<FeedbackProvider>(
          builder: (context, feedbackProvider, child) {
            List<FeedbackData> feedbackList = feedbackProvider.feedbackList;
            return ListView.builder(
              itemCount: feedbackList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${feedbackList[index].userEmail}: ${feedbackList[index].feedback}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}