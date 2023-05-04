library user;

abstract class UserRepository {
  Future getUser(
    String userId,
  );
}
