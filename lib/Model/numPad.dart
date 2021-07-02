class NumPadModel {
  String? value;
  bool space;
  bool delete;
  bool empty;

  NumPadModel({
    this.value,
    this.space = false,
    this.delete = false,
    this.empty = false,
  });
}
