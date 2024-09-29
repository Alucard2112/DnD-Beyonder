enum SourceBook{
  ai,
  aventh,
  aventm,
  bomt,
  cthulhu,
  dosi,
  eepc,
  egtw,
  ff2g,
  ff3c,
  ftod,
  humblewood,
  idrotf,
  mtgafr,
  mythaddm,
  mythheld,
  mythsaga,
  mythwelt,
  pamsato,
  phb,
  pota,
  ragnarok,
  sasaag,
  scag,
  scc,
  srd,
  tcoe,
  xge,
  xphb,
  hbrew
}

String sourceBookToString(SourceBook book){
  switch(book){
    case SourceBook.ai:
      return "Acquisitions Incorporated";
    case SourceBook.aventh:
      return "Aventurische Helden";
    case SourceBook.aventm:
      return "Aventurische Monster";
    case SourceBook.bomt:
      return "The Book of Many Things";
    case SourceBook.cthulhu:
      return "Sandy Petersens Cthulhu Mythos";
    case SourceBook.dosi:
      return "Die Drachen der Sturmwrack-Insel";
    case SourceBook.eepc:
      return "Elemental Evil Player’s Companion";
    case SourceBook.egtw:
      return "Explorer's Guide to Wildemount";
    case SourceBook.ff2g:
      return "Fateforge: 2. Die Erwachten";
    case SourceBook.ff3c:
      return "Fateforge: 3. Creatures";
    case SourceBook.ftod:
      return "Fizbans Schatzkammer der Drachen";
    case SourceBook.humblewood:
      return "Humblewood";
    case SourceBook.idrotf:
      return "Eiswindtal: Ode der Frostmaid";
    case SourceBook.mtgafr:
      return "Abenteuer in den Forgotten Realms";
    case SourceBook.mythaddm:
      return "Mythgart Abenteuer des Dunklen Meisters";
    case SourceBook.mythheld:
      return "Mythgart Handbuch der Helden";
    case SourceBook.mythsaga:
      return "Mythgart Sagas";
    case SourceBook.mythwelt:
      return "Mythgart Weltenbuch";
    case SourceBook.pamsato:
      return "Planescape Adventures in the Multiverse: Sigil and the Outlands";
    case SourceBook.phb:
      return "Spielerhandbuch (2014)";
    case SourceBook.pota:
      return "Prinzen der Apokalypse";
    case SourceBook.ragnarok:
      return "Journey to Ragnarok";
    case SourceBook.sasaag:
      return "Spelljammer Adventures in Space: Astral Adventurer's Guide";
    case SourceBook.scag:
      return "Abenteurerhandbuch der Schwertküste";
    case SourceBook.scc:
      return "Strixhaven: A Curriculum of Chaos";
    case SourceBook.srd:
      return "Systemreferenzdokument";
    case SourceBook.tcoe:
      return "Tashas Kessel mit Allem";
    case SourceBook.xge:
      return "Xanathars Ratgeber für Alles";
    case SourceBook.xphb:
      return "Spielerhandbuch (2024)";
    default:
      return "Homebrew";
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