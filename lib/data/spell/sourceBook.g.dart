// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sourceBook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceBookAdapter extends TypeAdapter<SourceBook> {
  @override
  final int typeId = 12;

  @override
  SourceBook read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SourceBook.ai;
      case 1:
        return SourceBook.aventh;
      case 2:
        return SourceBook.aventm;
      case 3:
        return SourceBook.bomt;
      case 4:
        return SourceBook.cthulhu;
      case 5:
        return SourceBook.dosi;
      case 6:
        return SourceBook.eepc;
      case 7:
        return SourceBook.egtw;
      case 8:
        return SourceBook.ff2g;
      case 9:
        return SourceBook.ff3c;
      case 10:
        return SourceBook.ftod;
      case 11:
        return SourceBook.humblewood;
      case 12:
        return SourceBook.idrotf;
      case 13:
        return SourceBook.mtgafr;
      case 14:
        return SourceBook.mythaddm;
      case 15:
        return SourceBook.mythheld;
      case 16:
        return SourceBook.mythsaga;
      case 17:
        return SourceBook.mythwelt;
      case 18:
        return SourceBook.pamsato;
      case 19:
        return SourceBook.phb;
      case 20:
        return SourceBook.pota;
      case 21:
        return SourceBook.ragnarok;
      case 22:
        return SourceBook.sasaag;
      case 23:
        return SourceBook.scag;
      case 24:
        return SourceBook.scc;
      case 25:
        return SourceBook.srd;
      case 26:
        return SourceBook.tcoe;
      case 27:
        return SourceBook.xge;
      case 28:
        return SourceBook.xphb;
      case 29:
        return SourceBook.hbrew;
      default:
        return SourceBook.ai;
    }
  }

  @override
  void write(BinaryWriter writer, SourceBook obj) {
    switch (obj) {
      case SourceBook.ai:
        writer.writeByte(0);
        break;
      case SourceBook.aventh:
        writer.writeByte(1);
        break;
      case SourceBook.aventm:
        writer.writeByte(2);
        break;
      case SourceBook.bomt:
        writer.writeByte(3);
        break;
      case SourceBook.cthulhu:
        writer.writeByte(4);
        break;
      case SourceBook.dosi:
        writer.writeByte(5);
        break;
      case SourceBook.eepc:
        writer.writeByte(6);
        break;
      case SourceBook.egtw:
        writer.writeByte(7);
        break;
      case SourceBook.ff2g:
        writer.writeByte(8);
        break;
      case SourceBook.ff3c:
        writer.writeByte(9);
        break;
      case SourceBook.ftod:
        writer.writeByte(10);
        break;
      case SourceBook.humblewood:
        writer.writeByte(11);
        break;
      case SourceBook.idrotf:
        writer.writeByte(12);
        break;
      case SourceBook.mtgafr:
        writer.writeByte(13);
        break;
      case SourceBook.mythaddm:
        writer.writeByte(14);
        break;
      case SourceBook.mythheld:
        writer.writeByte(15);
        break;
      case SourceBook.mythsaga:
        writer.writeByte(16);
        break;
      case SourceBook.mythwelt:
        writer.writeByte(17);
        break;
      case SourceBook.pamsato:
        writer.writeByte(18);
        break;
      case SourceBook.phb:
        writer.writeByte(19);
        break;
      case SourceBook.pota:
        writer.writeByte(20);
        break;
      case SourceBook.ragnarok:
        writer.writeByte(21);
        break;
      case SourceBook.sasaag:
        writer.writeByte(22);
        break;
      case SourceBook.scag:
        writer.writeByte(23);
        break;
      case SourceBook.scc:
        writer.writeByte(24);
        break;
      case SourceBook.srd:
        writer.writeByte(25);
        break;
      case SourceBook.tcoe:
        writer.writeByte(26);
        break;
      case SourceBook.xge:
        writer.writeByte(27);
        break;
      case SourceBook.xphb:
        writer.writeByte(28);
        break;
      case SourceBook.hbrew:
        writer.writeByte(29);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
