import 'package:dnd_beyonder/gui/Screens/loadingScreen.dart';
import 'package:dnd_beyonder/gui/Screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

import 'data/gui/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnD Beyonder',
      localizationsDelegates: const [ S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(body: SafeArea(child: LoadingScreen()),
        backgroundColor: scaffoldBackgroundColor,),
      //home: Scaffold(body: SpellWidget(Spell.fromJsonString("{ 	\"name\": \"Animal Friendship\", 	\"source\": \"PHB\", 	\"page\": 212, 	\"srd\": true, 	\"level\": 1, 	\"school\": \"E\", 	\"time\": [ 		{ 			\"number\": 1, 			\"unit\": \"action\" 		} 	], 	\"range\": { 		\"type\": \"point\", 		\"distance\": { 			\"type\": \"feet\", 			\"amount\": 30 		} 	}, 	\"components\": { 		\"v\": true, 		\"s\": true, 		\"m\": \"a morsel of food\" 	}, 	\"duration\": [ 		{ 			\"type\": \"timed\", 			\"duration\": { 				\"type\": \"hour\", 				\"amount\": 24 			} 		} 	], 	\"entries\": [ 		\"This spell lets you convince a beast that you mean it no harm. Choose a beast that you can see within range. It must see and hear you. If the beast's Intelligence is 4 or higher, the spell fails. Otherwise, the beast must succeed on a Wisdom saving throw or be {@condition charmed} by you for the spell's duration. If you or one of your companions harms the target, the spell ends.\" 	], 	\"entriesHigherLevel\": [ 		{ 			\"type\": \"entries\", 			\"name\": \"At Higher Levels\", 			\"entries\": [ 				\"When you cast this spell using a spell slot of 2nd level or higher, you can affect one additional beast for each slot level above 1st.\" 			] 		} 	], 	\"conditionInflict\": [ 		\"charmed\" 	], 	\"savingThrow\": [ 		\"wisdom\" 	], 	\"affectsCreatureType\": [ 		\"beast\" 	], 	\"miscTags\": [ 		\"SGT\" 	], 	\"areaTags\": [ 		\"ST\" 	], 	\"classes\": { 		\"fromClassList\": [ 			{ 				\"name\": \"Bard\", 				\"source\": \"PHB\" 			}, 			{ 				\"name\": \"Druid\", 				\"source\": \"PHB\" 			}, 			{ 				\"name\": \"Ranger\", 				\"source\": \"PHB\" 			} 		], 		\"fromSubclass\": [ 			{ 				\"class\": { 					\"name\": \"Cleric\", 					\"source\": \"PHB\" 				}, 				\"subclass\": { 					\"name\": \"Nature Domain\", 					\"shortName\": \"Nature\", 					\"source\": \"PHB\" 				} 			} 		] 	}, 	\"races\": [ 		{ 			\"name\": \"Human (Mark of Handling)\", 			\"source\": \"ERLW\", 			\"baseName\": \"Human\", 			\"baseSource\": \"PHB\" 		}, 		{ 			\"name\": \"Yuan-Ti\", 			\"source\": \"MPMM\" 		}, 		{ 			\"name\": \"Yuan-ti Pureblood\", 			\"source\": \"VGM\" 		} 	], 	\"backgrounds\": [ 		{ 			\"name\": \"Selesnya Initiate\", 			\"source\": \"GGR\" 		} 	], 	\"feats\": [ 		{ 			\"name\": \"Divinely Favored\", 			\"source\": \"DSotDQ\" 		}, 		{ 			\"name\": \"Fey Touched\", 			\"source\": \"TCE\" 		}, 		{ 			\"name\": \"Magic Initiate\", 			\"source\": \"PHB\" 		}, 		{ 			\"name\": \"Strixhaven Initiate\", 			\"source\": \"SCC\" 		} 	] } ")))
    );
  }
}