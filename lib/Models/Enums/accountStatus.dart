enum AccountStatus {
  ACTIVATED,
  DEACTIVATED,
}

extension AccountStatusExtension on AccountStatus {
  String toJsonString() {
    switch (this) {
      case AccountStatus.ACTIVATED:
        return 'ACTIVATED';
      case AccountStatus.DEACTIVATED:
        return 'DEACTIVATED';
    }
  }
}
