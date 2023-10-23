enum MainEndpoints {
  login,
  users,
}

extension MainEndPointExtension on MainEndpoints {
  String get path {
    switch (this) {
      case MainEndpoints.login:
        return "api/login";
      case MainEndpoints.users:
        return "api/users";
    }
  }
}
