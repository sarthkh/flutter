import "package:quiz_app/model/quiz_question.dart";

const questions = [
  QuizQuestion(
    text: "What is the primary unit of composition in a Flutter application?",
    answers: [
      'Widgets',
      'Elements',
      'Containers',
      'Components',
    ],
  ),
  QuizQuestion(
    text: 'What is the basic principle for creating UIs in Flutter?',
    answers: [
      'Declaring widgets in Dart code',
      'Dragging and dropping widgets in a GUI tool',
      'Writing widgets in XML layout files',
      'Assembling widgets in separate design software',
    ],
  ),
  QuizQuestion(
    text: 'What is the main role of a StatefulWidget within Flutter?',
    answers: [
      'Maintain state across frames',
      'Provide static content',
      'Act as a placeholder for other widgets',
      'Route data between UI components',
    ],
  ),
  QuizQuestion(
    text:
        'In terms of performance, which widget is generally preferred when the UI does not change state?',
    answers: [
      'StatelessWidget',
      'StatefulWidget',
      'They have similar performance characteristics',
      'The choice does not affect performance',
    ],
  ),
  QuizQuestion(
    text: 'What occurs when the properties of a StatelessWidget are modified?',
    answers: [
      'Nothing, because StatelessWidget has immutable properties',
      'It causes the widget to rebuild automatically',
      'The modification is ignored',
      'It throws an error',
    ],
  ),
  QuizQuestion(
    text:
        'What is the correct way to signal that the state of a StatefulWidget has changed?',
    answers: [
      'Calling setState() within the StatefulWidget',
      'Modifying the state variables directly',
      'Refreshing the app',
      'Rebuilding the entire widget tree',
    ],
  ),
];
