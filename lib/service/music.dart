class GetMusicResType {
  final int id;
  final String code;
  final String name;
  final String answer;
  final GenreType genre;
  final int startAt;
  final Hint hint;

  GetMusicResType({
    required this.id,
    required this.code,
    required this.name,
    required this.answer,
    required this.genre,
    required this.startAt,
    required this.hint,
  });
}

class GenreType {
}

class Hint {
  final int id;
  final int hint1;
  final String hint2;
  final String hint3;

  Hint({
    required this.id,
    required this.hint1,
    required this.hint2,
    required this.hint3,
  });
}
