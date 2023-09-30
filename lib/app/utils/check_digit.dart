String tambahkanNolDiDepan(int input) {
  if (input < 10) return '0$input';
  return input.toString();
}
