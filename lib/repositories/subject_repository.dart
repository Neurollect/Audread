library authentication;

abstract class SubjectRepository {
  Future getSubject(
    String id,
  );
}
