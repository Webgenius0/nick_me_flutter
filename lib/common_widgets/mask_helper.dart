String maskEmail(String email) {
  final parts = email.split('@');
  if (parts.length != 2) return email;
  final name = parts[0];
  final domain = parts[1];
  if (name.length <= 2) {
    return '${name[0]}***@$domain';
  }
  return '${name[0]}****${name[name.length - 1]}@$domain';
}
