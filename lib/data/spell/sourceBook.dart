import 'package:hive/hive.dart';

import '../../generated/l10n.dart';

part 'sourceBook.g.dart';

@HiveType(typeId: 12)
enum SourceBook{
  @HiveField(0)
  ai,
  @HiveField(1)
  aventh,
  @HiveField(2)
  aventm,
  @HiveField(3)
  bomt,
  @HiveField(4)
  cthulhu,
  @HiveField(5)
  dosi,
  @HiveField(6)
  eepc,
  @HiveField(7)
  egtw,
  @HiveField(8)
  ff2g,
  @HiveField(9)
  ff3c,
  @HiveField(10)
  ftod,
  @HiveField(11)
  humblewood,
  @HiveField(12)
  idrotf,
  @HiveField(13)
  mtgafr,
  @HiveField(14)
  mythaddm,
  @HiveField(15)
  mythheld,
  @HiveField(16)
  mythsaga,
  @HiveField(17)
  mythwelt,
  @HiveField(18)
  pamsato,
  @HiveField(19)
  phb,
  @HiveField(20)
  pota,
  @HiveField(21)
  ragnarok,
  @HiveField(22)
  sasaag,
  @HiveField(23)
  scag,
  @HiveField(24)
  scc,
  @HiveField(25)
  srd,
  @HiveField(26)
  tcoe,
  @HiveField(27)
  xge,
  @HiveField(28)
  xphb,
  @HiveField(29)
  hbrew
}

String sourceBookToString(SourceBook book){
  switch(book){
    case SourceBook.ai:
      return S.current.ai;
    case SourceBook.aventh:
      return S.current.aventh;
    case SourceBook.aventm:
      return S.current.aventm;
    case SourceBook.bomt:
      return S.current.bomt;
    case SourceBook.cthulhu:
      return S.current.cthulhu;
    case SourceBook.dosi:
      return S.current.dosi;
    case SourceBook.eepc:
      return S.current.eepc;
    case SourceBook.egtw:
      return S.current.egtw;
    case SourceBook.ff2g:
      return S.current.ff2g;
    case SourceBook.ff3c:
      return S.current.ff3c;
    case SourceBook.ftod:
      return S.current.ftod;
    case SourceBook.humblewood:
      return S.current.humblewood;
    case SourceBook.idrotf:
      return S.current.idrotf;
    case SourceBook.mtgafr:
      return S.current.mtgafr;
    case SourceBook.mythaddm:
      return S.current.mythaddm;
    case SourceBook.mythheld:
      return S.current.mythheld;
    case SourceBook.mythsaga:
      return S.current.mythsaga;
    case SourceBook.mythwelt:
      return S.current.mythwelt;
    case SourceBook.pamsato:
      return S.current.pamsato;
    case SourceBook.phb:
      return S.current.phb;
    case SourceBook.pota:
      return S.current.pota;
    case SourceBook.ragnarok:
      return S.current.ragnarok;
    case SourceBook.sasaag:
      return S.current.sasaag;
    case SourceBook.scag:
      return S.current.scag;
    case SourceBook.scc:
      return S.current.scc;
    case SourceBook.srd:
      return S.current.srd;
    case SourceBook.tcoe:
      return S.current.tcoe;
    case SourceBook.xge:
      return S.current.xge;
    case SourceBook.xphb:
      return S.current.xphb;
    default:
      return S.current.homebrew;
  }
}

SourceBook sourceBookFromShortString(String s){
  switch(s.toLowerCase()){
    case "ai":
      return SourceBook.ai;
    case "avent-h":
      return SourceBook.aventh;
    case "avent-m":
      return SourceBook.aventm;
    case "bomt":
      return SourceBook.bomt;
    case "cthulhu":
      return SourceBook.cthulhu;
    case "dosi":
      return SourceBook.dosi;
    case "eepc":
      return SourceBook.eepc;
    case "egtw":
      return SourceBook.egtw;
    case "ff2g":
      return SourceBook.ff2g;
    case "ff3c":
      return SourceBook.ff3c;
    case "ftod":
      return SourceBook.ftod;
    case "humblewood":
      return SourceBook.humblewood;
    case "idrotf":
      return SourceBook.idrotf;
    case "mtgafr":
      return SourceBook.mtgafr;
    case "myth-addm":
      return SourceBook.mythaddm;
    case "myth-held":
      return SourceBook.mythheld;
    case "myth-saga":
      return SourceBook.mythsaga;
    case "myth-welt":
      return SourceBook.mythwelt;
    case "pam:sato":
      return SourceBook.pamsato;
    case "phb":
      return SourceBook.phb;
    case "pota":
      return SourceBook.pota;
    case "ragnarok":
      return SourceBook.ragnarok;
    case "sas:aag":
      return SourceBook.sasaag;
    case "scag":
      return SourceBook.scag;
    case "scc":
      return SourceBook.scc;
    case "srd":
      return SourceBook.srd;
    case "tcoe":
      return SourceBook.tcoe;
    case "xge":
      return SourceBook.xge;
    case "xphb":
      return SourceBook.xphb;
  default:
    return SourceBook.hbrew;
  }
}