import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String username;
  final int number;
  final bool isActive;
  final bool aerobics;
  final bool golf;
  final bool football;
  final bool baseball;
  final bool cycling;
  final bool waterSports;
  final bool volleyball;
  final bool inlineOriceSkating;
  final bool skiingOrsnowBoarding;
  final bool walkingOrhiking;
  final bool horsebackRiding;
  final bool runningOrcardio;
  final bool tennisOrracquetSports;
  final bool autoracingOrmotorcrosss;
  final bool billiardsOrpool;
  final bool bowling;
  final bool hockey;
  final bool basketball;
  final bool independent;
  final bool swimming;
  final bool rugby;
  final bool anythingGoes;
  final bool conventionalSexOnly;
  final bool readingEroticLiterature;
  final bool threesomeOrmore;
  final bool beingDominated;
  final bool dominating;
  final bool romanticSex;
  final bool watchingEroticMovies;
  final bool beingBlindFolded;
  final bool costumes;
  final bool rolePlaying;
  final bool usingSexToy;
  final bool beingWatched;
  final bool private;
  final bool sexInUnusualPlaces;
  final bool anythingExciting;
  final bool longTerm;
  final bool openToanything;
  final bool shortTerm;
  final bool undecided;
  final bool virtual;
  final bool smoker;
  final bool reliable;
  final bool activeOrlikely;
  final bool generous;
  final bool shy;
  final bool ambitious;
  final bool fun;
  final bool imaginative;
  final bool openMinded;
  final bool socialable;
  final bool chatty;
  final bool sophisticated;
  final bool outgoingOrtalkative;
  final bool honestOrfrank;
  final bool cheerful;
  final bool modest;
  final bool selfConfident;
  final bool calm;
  final bool cultivated;
  final bool moody;
  final bool spiritual;
  final bool sensitive;
  final bool mature;
  final bool platonic;
  final bool friendship;
  final bool soulmate;
  final bool romantic;
  final bool chatting;
  final bool passionate;
  final bool learningOrexchanging;
  final bool companionship;
  final bool discretionOrsecrecy;
  final bool justAfling;
  final bool noParticularExpectation;
  final bool oneNightStand;
  final bool purelySexual;
  final bool experienceSharing;
  final bool noStringsAttached;
  final bool somethingSerious;
  final bool homosexualOrbisexual;
  final bool takingThingsSlow;
  final bool loving;
  final bool playful;
  final bool complicity;
  final bool swinning;
  final bool artAndcraft;
  final bool hiking;
  final bool workingout;
  final bool petsOranimals;
  final bool networkingOrsocialising;
  final bool playingcardsOrboardgems;
  final bool museumsOrgalleries;
  final bool shoppingOrantiques;
  final bool religionOrspirituality;
  final bool wineOrfoodTasing;
  final bool watchingSports;
  final bool bookOrdiscussionClubs;
  final bool nightClubsOrdancing;
  final bool musicOrconcerts;
  final bool coffeeOrconversation;
  final bool performingArtsOrtheatre;
  final bool travelingOrsightseeing;
  final bool charitiesOrorganisation;
  final bool cookingOrbaking;
  final bool videoGame;
  final bool fishingOrhunting;
  final bool gardening;
  final String id;
  final List<dynamic> images;
  final String createdAt;
  final String updatedAt;
  final String token;
  UserModel({
    required this.username,
    required this.number,
    required this.isActive,
    required this.aerobics,
    required this.golf,
    required this.football,
    required this.baseball,
    required this.cycling,
    required this.waterSports,
    required this.volleyball,
    required this.inlineOriceSkating,
    required this.skiingOrsnowBoarding,
    required this.walkingOrhiking,
    required this.horsebackRiding,
    required this.runningOrcardio,
    required this.tennisOrracquetSports,
    required this.autoracingOrmotorcrosss,
    required this.billiardsOrpool,
    required this.bowling,
    required this.hockey,
    required this.basketball,
    required this.independent,
    required this.swimming,
    required this.rugby,
    required this.anythingGoes,
    required this.conventionalSexOnly,
    required this.readingEroticLiterature,
    required this.threesomeOrmore,
    required this.beingDominated,
    required this.dominating,
    required this.romanticSex,
    required this.watchingEroticMovies,
    required this.beingBlindFolded,
    required this.costumes,
    required this.rolePlaying,
    required this.usingSexToy,
    required this.beingWatched,
    required this.private,
    required this.sexInUnusualPlaces,
    required this.anythingExciting,
    required this.longTerm,
    required this.openToanything,
    required this.shortTerm,
    required this.undecided,
    required this.virtual,
    required this.smoker,
    required this.reliable,
    required this.activeOrlikely,
    required this.generous,
    required this.shy,
    required this.ambitious,
    required this.fun,
    required this.imaginative,
    required this.openMinded,
    required this.socialable,
    required this.chatty,
    required this.sophisticated,
    required this.outgoingOrtalkative,
    required this.honestOrfrank,
    required this.cheerful,
    required this.modest,
    required this.selfConfident,
    required this.calm,
    required this.cultivated,
    required this.moody,
    required this.spiritual,
    required this.sensitive,
    required this.mature,
    required this.platonic,
    required this.friendship,
    required this.soulmate,
    required this.romantic,
    required this.chatting,
    required this.passionate,
    required this.learningOrexchanging,
    required this.companionship,
    required this.discretionOrsecrecy,
    required this.justAfling,
    required this.noParticularExpectation,
    required this.oneNightStand,
    required this.purelySexual,
    required this.experienceSharing,
    required this.noStringsAttached,
    required this.somethingSerious,
    required this.homosexualOrbisexual,
    required this.takingThingsSlow,
    required this.loving,
    required this.playful,
    required this.complicity,
    required this.swinning,
    required this.artAndcraft,
    required this.hiking,
    required this.workingout,
    required this.petsOranimals,
    required this.networkingOrsocialising,
    required this.playingcardsOrboardgems,
    required this.museumsOrgalleries,
    required this.shoppingOrantiques,
    required this.religionOrspirituality,
    required this.wineOrfoodTasing,
    required this.watchingSports,
    required this.bookOrdiscussionClubs,
    required this.nightClubsOrdancing,
    required this.musicOrconcerts,
    required this.coffeeOrconversation,
    required this.performingArtsOrtheatre,
    required this.travelingOrsightseeing,
    required this.charitiesOrorganisation,
    required this.cookingOrbaking,
    required this.videoGame,
    required this.fishingOrhunting,
    required this.gardening,
    required this.id,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'number': number,
      'isActive': isActive,
      'aerobics': aerobics,
      'golf': golf,
      'football': football,
      'baseball': baseball,
      'cycling': cycling,
      'waterSports': waterSports,
      'volleyball': volleyball,
      'inlineOriceSkating': inlineOriceSkating,
      'skiingOrsnowBoarding': skiingOrsnowBoarding,
      'walkingOrhiking': walkingOrhiking,
      'horsebackRiding': horsebackRiding,
      'runningOrcardio': runningOrcardio,
      'tennisOrracquetSports': tennisOrracquetSports,
      'autoracingOrmotorcrosss': autoracingOrmotorcrosss,
      'billiardsOrpool': billiardsOrpool,
      'bowling': bowling,
      'hockey': hockey,
      'basketball': basketball,
      'independent': independent,
      'swimming': swimming,
      'rugby': rugby,
      'anythingGoes': anythingGoes,
      'conventionalSexOnly': conventionalSexOnly,
      'readingEroticLiterature': readingEroticLiterature,
      'threesomeOrmore': threesomeOrmore,
      'beingDominated': beingDominated,
      'dominating': dominating,
      'romanticSex': romanticSex,
      'watchingEroticMovies': watchingEroticMovies,
      'beingBlindFolded': beingBlindFolded,
      'costumes': costumes,
      'rolePlaying': rolePlaying,
      'usingSexToy': usingSexToy,
      'beingWatched': beingWatched,
      'private': private,
      'sexInUnusualPlaces': sexInUnusualPlaces,
      'anythingExciting': anythingExciting,
      'longTerm': longTerm,
      'openToanything': openToanything,
      'shortTerm': shortTerm,
      'undecided': undecided,
      'virtual': virtual,
      'smoker': smoker,
      'reliable': reliable,
      'activeOrlikely': activeOrlikely,
      'generous': generous,
      'shy': shy,
      'ambitious': ambitious,
      'fun': fun,
      'imaginative': imaginative,
      'openMinded': openMinded,
      'socialable': socialable,
      'chatty': chatty,
      'sophisticated': sophisticated,
      'outgoingOrtalkative': outgoingOrtalkative,
      'honestOrfrank': honestOrfrank,
      'cheerful': cheerful,
      'modest': modest,
      'selfConfident': selfConfident,
      'calm': calm,
      'cultivated': cultivated,
      'moody': moody,
      'spiritual': spiritual,
      'sensitive': sensitive,
      'mature': mature,
      'platonic': platonic,
      'friendship': friendship,
      'soulmate': soulmate,
      'romantic': romantic,
      'chatting': chatting,
      'passionate': passionate,
      'learningOrexchanging': learningOrexchanging,
      'companionship': companionship,
      'discretionOrsecrecy': discretionOrsecrecy,
      'justAfling': justAfling,
      'noParticularExpectation': noParticularExpectation,
      'oneNightStand': oneNightStand,
      'purelySexual': purelySexual,
      'experienceSharing': experienceSharing,
      'noStringsAttached': noStringsAttached,
      'somethingSerious': somethingSerious,
      'homosexualOrbisexual': homosexualOrbisexual,
      'takingThingsSlow': takingThingsSlow,
      'loving': loving,
      'playful': playful,
      'complicity': complicity,
      'swinning': swinning,
      'artAndcraft': artAndcraft,
      'hiking': hiking,
      'workingout': workingout,
      'petsOranimals': petsOranimals,
      'networkingOrsocialising': networkingOrsocialising,
      'playingcardsOrboardgems': playingcardsOrboardgems,
      'museumsOrgalleries': museumsOrgalleries,
      'shoppingOrantiques': shoppingOrantiques,
      'religionOrspirituality': religionOrspirituality,
      'wineOrfoodTasing': wineOrfoodTasing,
      'watchingSports': watchingSports,
      'bookOrdiscussionClubs': bookOrdiscussionClubs,
      'nightClubsOrdancing': nightClubsOrdancing,
      'musicOrconcerts': musicOrconcerts,
      'coffeeOrconversation': coffeeOrconversation,
      'performingArtsOrtheatre': performingArtsOrtheatre,
      'travelingOrsightseeing': travelingOrsightseeing,
      'charitiesOrorganisation': charitiesOrorganisation,
      'cookingOrbaking': cookingOrbaking,
      'videoGame': videoGame,
      'fishingOrhunting': fishingOrhunting,
      'gardening': gardening,
      'id': id,
      'images': images,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      number: map['number'] as int,
      isActive: map['isActive'] as bool,
      aerobics: map['aerobics'] as bool,
      golf: map['golf'] as bool,
      football: map['football'] as bool,
      baseball: map['baseball'] as bool,
      cycling: map['cycling'] as bool,
      waterSports: map['waterSports'] as bool,
      volleyball: map['volleyball'] as bool,
      inlineOriceSkating: map['inlineOriceSkating'] as bool,
      skiingOrsnowBoarding: map['skiingOrsnowBoarding'] as bool,
      walkingOrhiking: map['walkingOrhiking'] as bool,
      horsebackRiding: map['horsebackRiding'] as bool,
      runningOrcardio: map['runningOrcardio'] as bool,
      tennisOrracquetSports: map['tennisOrracquetSports'] as bool,
      autoracingOrmotorcrosss: map['autoracingOrmotorcrosss'] as bool,
      billiardsOrpool: map['billiardsOrpool'] as bool,
      bowling: map['bowling'] as bool,
      hockey: map['hockey'] as bool,
      basketball: map['basketball'] as bool,
      independent: map['independent'] as bool,
      swimming: map['swimming'] as bool,
      rugby: map['rugby'] as bool,
      anythingGoes: map['anythingGoes'] as bool,
      conventionalSexOnly: map['conventionalSexOnly'] as bool,
      readingEroticLiterature: map['readingEroticLiterature'] as bool,
      threesomeOrmore: map['threesomeOrmore'] as bool,
      beingDominated: map['beingDominated'] as bool,
      dominating: map['dominating'] as bool,
      romanticSex: map['romanticSex'] as bool,
      watchingEroticMovies: map['watchingEroticMovies'] as bool,
      beingBlindFolded: map['beingBlindFolded'] as bool,
      costumes: map['costumes'] as bool,
      rolePlaying: map['rolePlaying'] as bool,
      usingSexToy: map['usingSexToy'] as bool,
      beingWatched: map['beingWatched'] as bool,
      private: map['private'] as bool,
      sexInUnusualPlaces: map['sexInUnusualPlaces'] as bool,
      anythingExciting: map['anythingExciting'] as bool,
      longTerm: map['longTerm'] as bool,
      openToanything: map['openToanything'] as bool,
      shortTerm: map['shortTerm'] as bool,
      undecided: map['undecided'] as bool,
      virtual: map['virtual'] as bool,
      smoker: map['smoker'] as bool,
      reliable: map['reliable'] as bool,
      activeOrlikely: map['activeOrlikely'] as bool,
      generous: map['generous'] as bool,
      shy: map['shy'] as bool,
      ambitious: map['ambitious'] as bool,
      fun: map['fun'] as bool,
      imaginative: map['imaginative'] as bool,
      openMinded: map['openMinded'] as bool,
      socialable: map['socialable'] as bool,
      chatty: map['chatty'] as bool,
      sophisticated: map['sophisticated'] as bool,
      outgoingOrtalkative: map['outgoingOrtalkative'] as bool,
      honestOrfrank: map['honestOrfrank'] as bool,
      cheerful: map['cheerful'] as bool,
      modest: map['modest'] as bool,
      selfConfident: map['selfConfident'] as bool,
      calm: map['calm'] as bool,
      cultivated: map['cultivated'] as bool,
      moody: map['moody'] as bool,
      spiritual: map['spiritual'] as bool,
      sensitive: map['sensitive'] as bool,
      mature: map['mature'] as bool,
      platonic: map['platonic'] as bool,
      friendship: map['friendship'] as bool,
      soulmate: map['soulmate'] as bool,
      romantic: map['romantic'] as bool,
      chatting: map['chatting'] as bool,
      passionate: map['passionate'] as bool,
      learningOrexchanging: map['learningOrexchanging'] as bool,
      companionship: map['companionship'] as bool,
      discretionOrsecrecy: map['discretionOrsecrecy'] as bool,
      justAfling: map['justAfling'] as bool,
      noParticularExpectation: map['noParticularExpectation'] as bool,
      oneNightStand: map['oneNightStand'] as bool,
      purelySexual: map['purelySexual'] as bool,
      experienceSharing: map['experienceSharing'] as bool,
      noStringsAttached: map['noStringsAttached'] as bool,
      somethingSerious: map['somethingSerious'] as bool,
      homosexualOrbisexual: map['homosexualOrbisexual'] as bool,
      takingThingsSlow: map['takingThingsSlow'] as bool,
      loving: map['loving'] as bool,
      playful: map['playful'] as bool,
      complicity: map['complicity'] as bool,
      swinning: map['swinning'] as bool,
      artAndcraft: map['artAndcraft'] as bool,
      hiking: map['hiking'] as bool,
      workingout: map['workingout'] as bool,
      petsOranimals: map['petsOranimals'] as bool,
      networkingOrsocialising: map['networkingOrsocialising'] as bool,
      playingcardsOrboardgems: map['playingcardsOrboardgems'] as bool,
      museumsOrgalleries: map['museumsOrgalleries'] as bool,
      shoppingOrantiques: map['shoppingOrantiques'] as bool,
      religionOrspirituality: map['religionOrspirituality'] as bool,
      wineOrfoodTasing: map['wineOrfoodTasing'] as bool,
      watchingSports: map['watchingSports'] as bool,
      bookOrdiscussionClubs: map['bookOrdiscussionClubs'] as bool,
      nightClubsOrdancing: map['nightClubsOrdancing'] as bool,
      musicOrconcerts: map['musicOrconcerts'] as bool,
      coffeeOrconversation: map['coffeeOrconversation'] as bool,
      performingArtsOrtheatre: map['performingArtsOrtheatre'] as bool,
      travelingOrsightseeing: map['travelingOrsightseeing'] as bool,
      charitiesOrorganisation: map['charitiesOrorganisation'] as bool,
      cookingOrbaking: map['cookingOrbaking'] as bool,
      videoGame: map['videoGame'] as bool,
      fishingOrhunting: map['fishingOrhunting'] as bool,
      gardening: map['gardening'] as bool,
      id: map['_id'] as String,
      images: List<dynamic>.from((map['images'] as List<dynamic>)),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
