class QuizQuestion {
  QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
