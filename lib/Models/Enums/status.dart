enum Status {
  UNSELECTED,
  UNCONFIRMED,
  ACCEPTED,
  REFUSED,
  IN_TRANSIT,
  DELIVERED
}

extension StatusExtension on Status {
  String toJsonString() {
    switch (this) {
      case Status.UNCONFIRMED:
        return 'UNCONFIRMED';
      case Status.UNSELECTED:
        return 'UNSELECTED';
      case Status.REFUSED:
        return 'REFUSED';
      case Status.ACCEPTED:
        return 'ACCEPTED';
      case Status.IN_TRANSIT:
        return 'IN_TRANSIT';
      case Status.DELIVERED:
        return 'DELIVERED';
    }
  }
}
