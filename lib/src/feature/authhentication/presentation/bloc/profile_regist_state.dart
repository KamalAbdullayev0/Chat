class ProfileState {
  final String username;
  final String email;
  final String password;
  final bool isLoading;
  final String? error;

  const ProfileState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.error,
  });

  ProfileState copyWith({
    String? username,
    String? email,
    String? password,
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
