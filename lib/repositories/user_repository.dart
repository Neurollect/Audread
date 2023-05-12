library user;

abstract class UserRepository {
  Future getUser();

  Future getMemberProfile(
    String memberId,
  );

  Future createMemberProfile(
    String firstName,
    String lastName,
    int avatar,
    String gender,
    String grade,
    String organization,
  );
}
