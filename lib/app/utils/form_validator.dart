class FormValidator {
  static String? commonString(String? q) {
    if (q == null || q.isEmpty || q == '') {
      return 'Tidak boleh kosong';
    }
    return null;
  }

  static String? allowedNull(String? q) {
    if (q!.isEmpty) {
      return null;
    }
    return null;
  }

  static String? email(String? q) {
    if (q == null || q.isEmpty || q == '') {
      return 'Tidak boleh kosong';
    }
    if (!q.contains('@')) {
      return 'Format email salah';
    }
    return null;
  }
}
