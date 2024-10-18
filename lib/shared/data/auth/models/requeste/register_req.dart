class RegisterReq {
  final String username;
  final String email;
  final String password;
  final String passwordConfirm;
  final String? avatar;

  RegisterReq({
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    this.avatar,
  });
}
