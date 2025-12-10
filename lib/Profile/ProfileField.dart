enum FieldType { text, number, dropdown, checkbox, date }

class ProfileField {
  final String key;
  final String label;
  dynamic value;
  final FieldType type;
  final List<String>? options;

  ProfileField({
    required this.key,
    required this.label,
    required this.value,
    required this.type,
    this.options,
  });
}