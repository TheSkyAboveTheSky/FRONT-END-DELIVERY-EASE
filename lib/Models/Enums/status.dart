enum Status {
  UNCONFIRMED,
  CONFIRMED,
  IN_PROGRESS,
  ACCEPTED,
  IN_TRANSIT,
  DELIVERED
}

extension StatusExtension on Status {
  String toJsonString() {
    switch (this) {
      case Status.UNCONFIRMED:
        return 'UNCONFIRMED';
      case Status.CONFIRMED:
        return 'CONFIRMED';
      case Status.IN_PROGRESS:
        return 'IN_PROGRESS';
      case Status.ACCEPTED:
        return 'ACCEPTED';
      case Status.IN_TRANSIT:
        return 'IN_TRANSIT';
      case Status.DELIVERED:
        return 'DELIVERED';
    }
  }
}