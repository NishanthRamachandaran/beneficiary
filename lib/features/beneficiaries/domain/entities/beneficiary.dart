class Beneficiary {
  final String name;
  final String id;
  final String bank;
  final String? avatarUrl;
  final String? localImage;

  const Beneficiary({
    required this.name,
    required this.id,
    required this.bank,
    this.avatarUrl,
    this.localImage,
  });
}
