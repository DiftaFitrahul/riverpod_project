enum LotieAnimation {
  dataNotFound(name: 'data_not_found'),
  error(name: 'error'),
  empty(name: 'empty'),
  smallError(name: 'small_error'),
  loading(name: 'loading');

  final String name;
  const LotieAnimation({required this.name});
}
