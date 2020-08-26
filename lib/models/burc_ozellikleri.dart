class BurcOzellikleri{

  String _burcAdi;
  String _burcTarih;
  String _burcOzellik;
  String _kucukResim;
  String _buyukResim;

  BurcOzellikleri(this._burcAdi, this._burcTarih, this._burcOzellik,
      this._kucukResim, this._buyukResim);

  String get buyukResim => _buyukResim;

  set buyukResim(String value) {
    _buyukResim = value;
  }

  String get kucukResim => _kucukResim;

  set kucukResim(String value) {
    _kucukResim = value;
  }

  String get burcOzellik => _burcOzellik;

  set burcOzellik(String value) {
    _burcOzellik = value;
  }

  String get burcTarih => _burcTarih;

  set burcTarih(String value) {
    _burcTarih = value;
  }

  String get burcAdi => _burcAdi;

  set burcAdi(String value) {
    _burcAdi = value;
  }
}