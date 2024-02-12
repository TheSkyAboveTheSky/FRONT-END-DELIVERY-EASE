enum Role { ADMIN, SENDER, DELIVERY_PERSON }



extension RoleExtension on Role {
  String toJsonString() {
    switch (this) {
      case Role.ADMIN:
        return 'ADMIN';
      case Role.SENDER:
        return 'SENDER';
      case Role.DELIVERY_PERSON:
        return 'DELIVERY_PERSON';
    }
  }
}
