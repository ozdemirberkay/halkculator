import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive_ce.dart';

/// A stock position: the purchase price per share and the number of shares.
@immutable
class StockPosition {
  const StockPosition({required this.price, required this.quantity});

  final double price;
  final int quantity;

  double get totalValue => price * quantity;
}

/// Hive adapter for [StockPosition].
///
/// Written by hand (no code generation) and kept byte-compatible with boxes
/// created by earlier app versions: type id 1, field 0 is the price and
/// field 1 is the quantity.
class StockPositionAdapter extends TypeAdapter<StockPosition> {
  static const _priceField = 0;
  static const _quantityField = 1;

  @override
  int get typeId => 1;

  @override
  StockPosition read(BinaryReader reader) {
    final fieldCount = reader.readByte();
    final fields = <int, Object?>{
      for (var i = 0; i < fieldCount; i++) reader.readByte(): reader.read(),
    };
    return StockPosition(
      price: (fields[_priceField]! as num).toDouble(),
      quantity: fields[_quantityField]! as int,
    );
  }

  @override
  void write(BinaryWriter writer, StockPosition obj) {
    writer
      ..writeByte(2)
      ..writeByte(_priceField)
      ..write(obj.price)
      ..writeByte(_quantityField)
      ..write(obj.quantity);
  }
}
