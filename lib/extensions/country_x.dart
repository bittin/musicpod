import 'package:podcast_search/podcast_search.dart';

import '../l10n/app_localizations.dart';

extension CountryX on Country {
  String localize(AppLocalizations l10n) => switch (this) {
    Country.none => l10n.regionNone,
    Country.afghanistan => l10n.regionAfghanistan,
    Country.alandislands => l10n.regionAlandislands,
    Country.albania => l10n.regionAlbania,
    Country.algeria => l10n.regionAlgeria,
    Country.americansamoa => l10n.regionAmericansamoa,
    Country.andorra => l10n.regionAndorra,
    Country.angolia => l10n.regionAngolia,
    Country.anguilla => l10n.regionAnguilla,
    Country.antarctica => l10n.regionAntarctica,
    Country.antiguaandbarbuda => l10n.regionAntiguaandbarbuda,
    Country.argentina => l10n.regionArgentina,
    Country.armenia => l10n.regionArmenia,
    Country.aruba => l10n.regionAruba,
    Country.australia => l10n.regionAustralia,
    Country.austria => l10n.regionAustria,
    Country.azerbaijan => l10n.regionAzerbaijan,
    Country.bahamas => l10n.regionBahamas,
    Country.bahrain => l10n.regionBahrain,
    Country.bangladesh => l10n.regionBangladesh,
    Country.barbados => l10n.regionBarbados,
    Country.belarus => l10n.regionBelarus,
    Country.belgium => l10n.regionBelgium,
    Country.belize => l10n.regionBelize,
    Country.benin => l10n.regionBenin,
    Country.bermuda => l10n.regionBermuda,
    Country.bhutan => l10n.regionBhutan,
    Country.bolivia => l10n.regionBolivia,
    Country.bonaire => l10n.regionBonaire,
    Country.bosniaAndHerzegovina => l10n.regionBosniaandherzegovina,
    Country.botswana => l10n.regionBotswana,
    Country.bouvetisland => l10n.regionBouvetisland,
    Country.brazil => l10n.regionBrazil,
    Country.britishIndianOceanTerrirory =>
      l10n.regionBritishindianoceanterrirory,
    Country.britishVirginIslands => l10n.regionBritishvirginislands,
    Country.bruneiDarussalam => l10n.regionBruneidarussalam,
    Country.bulgaria => l10n.regionBulgaria,
    Country.burkinafaso => l10n.regionBurkinafaso,
    Country.burundi => l10n.regionBurundi,
    Country.caboverde => l10n.regionCaboverde,
    Country.cambodia => l10n.regionCambodia,
    Country.cameroon => l10n.regionCameroon,
    Country.canada => l10n.regionCanada,
    Country.caymanIslands => l10n.regionCaymanislands,
    Country.centralAfricanRepublic => l10n.regionCentralafricanrepublic,
    Country.chad => l10n.regionChad,
    Country.chile => l10n.regionChile,
    Country.china => l10n.regionChina,
    Country.christmasIsland => l10n.regionChristmasisland,
    Country.cocosIslands => l10n.regionCocosislands,
    Country.colombia => l10n.regionColombia,
    Country.comoros => l10n.regionComoros,
    Country.congo => l10n.regionCongo,
    Country.congoDemocraticRepublicOf => l10n.regionCongodemocraticrepublicof,
    Country.cookIslands => l10n.regionCookislands,
    Country.costaRica => l10n.regionCostarica,
    Country.coteDivoire => l10n.regionCotedivoire,
    Country.croatia => l10n.regionCroatia,
    Country.cuba => l10n.regionCuba,
    Country.curacao => l10n.regionCuracao,
    Country.cyprus => l10n.regionCyprus,
    Country.czechia => l10n.regionCzechia,
    Country.denmark => l10n.regionDenmark,
    Country.djibouti => l10n.regionDjibouti,
    Country.dominica => l10n.regionDominica,
    Country.dominicanRepublic => l10n.regionDominicanrepublic,
    Country.ecuador => l10n.regionEcuador,
    Country.egypt => l10n.regionEgypt,
    Country.elSalvador => l10n.regionElsalvador,
    Country.equatorialGuinea => l10n.regionEquatorialguinea,
    Country.eritrea => l10n.regionEritrea,
    Country.estonia => l10n.regionEstonia,
    Country.ethiopia => l10n.regionEthiopia,
    Country.falklandIslands => l10n.regionFalklandislands,
    Country.faroeIslands => l10n.regionFaroeislands,
    Country.fiji => l10n.regionFiji,
    Country.finland => l10n.regionFinland,
    Country.france => l10n.regionFrance,
    Country.frenchGuiana => l10n.regionFrenchguiana,
    Country.frenchPolynesia => l10n.regionFrenchpolynesia,
    Country.frenchSouthernTerritories => l10n.regionFrenchsouthernterritories,
    Country.gabon => l10n.regionGabon,
    Country.gambia => l10n.regionGambia,
    Country.georgia => l10n.regionGeorgia,
    Country.germany => l10n.regionGermany,
    Country.ghana => l10n.regionGhana,
    Country.gibraltar => l10n.regionGibraltar,
    Country.greece => l10n.regionGreece,
    Country.greenland => l10n.regionGreenland,
    Country.grenada => l10n.regionGrenada,
    Country.guadeloupe => l10n.regionGuadeloupe,
    Country.guam => l10n.regionGuam,
    Country.guatemala => l10n.regionGuatemala,
    Country.guernsey => l10n.regionGuernsey,
    Country.guinea => l10n.regionGuinea,
    Country.guineaBissau => l10n.regionGuineabissau,
    Country.guyana => l10n.regionGuyana,
    Country.haiti => l10n.regionHaiti,
    Country.heardIslandAndMcDonaldIslands =>
      l10n.regionHeardislandandmcdonaldislands,
    Country.honduras => l10n.regionHonduras,
    Country.hongKong => l10n.regionHongkong,
    Country.hungary => l10n.regionHungary,
    Country.iceland => l10n.regionIceland,
    Country.india => l10n.regionIndia,
    Country.indonesia => l10n.regionIndonesia,
    Country.iran => l10n.regionIran,
    Country.iraq => l10n.regionIraq,
    Country.ireland => l10n.regionIreland,
    Country.isleOfMan => l10n.regionIsleofman,
    Country.israel => l10n.regionIsrael,
    Country.italy => l10n.regionItaly,
    Country.jamaica => l10n.regionJamaica,
    Country.japan => l10n.regionJapan,
    Country.jersey => l10n.regionJersey,
    Country.jordan => l10n.regionJordan,
    Country.kazakhstan => l10n.regionKazakhstan,
    Country.kenya => l10n.regionKenya,
    Country.kiribati => l10n.regionKiribati,
    Country.kuwait => l10n.regionKuwait,
    Country.kyrgyzstan => l10n.regionKyrgyzstan,
    Country.laos => l10n.regionLaos,
    Country.latvia => l10n.regionLatvia,
    Country.lebanon => l10n.regionLebanon,
    Country.lesotho => l10n.regionLesotho,
    Country.liberia => l10n.regionLiberia,
    Country.libya => l10n.regionLibya,
    Country.liechtenstein => l10n.regionLiechtenstein,
    Country.lithuania => l10n.regionLithuania,
    Country.luxembourg => l10n.regionLuxembourg,
    Country.macao => l10n.regionMacao,
    Country.macedonia => l10n.regionMacedonia,
    Country.madagascar => l10n.regionMadagascar,
    Country.malawi => l10n.regionMalawi,
    Country.malaysia => l10n.regionMalaysia,
    Country.maldives => l10n.regionMaldives,
    Country.mali => l10n.regionMali,
    Country.malta => l10n.regionMalta,
    Country.marshallIslands => l10n.regionMarshallislands,
    Country.martinique => l10n.regionMartinique,
    Country.mauritania => l10n.regionMauritania,
    Country.mauritius => l10n.regionMauritius,
    Country.mayotte => l10n.regionMayotte,
    Country.mexico => l10n.regionMexico,
    Country.micronesia => l10n.regionMicronesia,
    Country.moldova => l10n.regionMoldova,
    Country.monaco => l10n.regionMonaco,
    Country.mongolia => l10n.regionMongolia,
    Country.montenegro => l10n.regionMontenegro,
    Country.montserrat => l10n.regionMontserrat,
    Country.morocco => l10n.regionMorocco,
    Country.mozambique => l10n.regionMozambique,
    Country.myanmar => l10n.regionMyanmar,
    Country.namibia => l10n.regionNamibia,
    Country.nauru => l10n.regionNauru,
    Country.nepal => l10n.regionNepal,
    Country.netherlands => l10n.regionNetherlands,
    Country.newCaledonia => l10n.regionNewcaledonia,
    Country.newZealand => l10n.regionNewzealand,
    Country.nicaragua => l10n.regionNicaragua,
    Country.niger => l10n.regionNiger,
    Country.nigeria => l10n.regionNigeria,
    Country.niue => l10n.regionNiue,
    Country.norfolkIsland => l10n.regionNorfolkisland,
    Country.northKorea => l10n.regionNorthkorea,
    Country.northernMarianaIslands => l10n.regionNorthernmarianaislands,
    Country.norway => l10n.regionNorway,
    Country.oman => l10n.regionOman,
    Country.pakistan => l10n.regionPakistan,
    Country.palau => l10n.regionPalau,
    Country.palestine => l10n.regionPalestine,
    Country.panama => l10n.regionPanama,
    Country.papuaNewGuinea => l10n.regionPapuanewguinea,
    Country.paraguay => l10n.regionParaguay,
    Country.peru => l10n.regionPeru,
    Country.philippines => l10n.regionPhilippines,
    Country.pitcairn => l10n.regionPitcairn,
    Country.poland => l10n.regionPoland,
    Country.portugal => l10n.regionPortugal,
    Country.puertoRico => l10n.regionPuertorico,
    Country.qatar => l10n.regionQatar,
    Country.reunion => l10n.regionReunion,
    Country.romania => l10n.regionRomania,
    Country.russianFederation => l10n.regionRussianfederation,
    Country.rwanda => l10n.regionRwanda,
    Country.saintBarthelemy => l10n.regionSaintbarthelemy,
    Country.saintHelena => l10n.regionSainthelena,
    Country.saintKittsAndNevis => l10n.regionSaintkittsandnevis,
    Country.saintLucia => l10n.regionSaintlucia,
    Country.saintMartin => l10n.regionSaintmartin,
    Country.saintPierreAndMiquelon => l10n.regionSaintpierreandmiquelon,
    Country.saintVincentAndTheGrenadines =>
      l10n.regionSaintvincentandthegrenadines,
    Country.samoa => l10n.regionSamoa,
    Country.sanMarino => l10n.regionSanmarino,
    Country.saoTomeAndPrincipe => l10n.regionSaotomeandprincipe,
    Country.saudiArabia => l10n.regionSaudiarabia,
    Country.senegal => l10n.regionSenegal,
    Country.serbia => l10n.regionSerbia,
    Country.seychelles => l10n.regionSeychelles,
    Country.sierraLeone => l10n.regionSierraleone,
    Country.singapore => l10n.regionSingapore,
    Country.sintMaarten => l10n.regionSintmaarten,
    Country.slovakia => l10n.regionSlovakia,
    Country.slovenia => l10n.regionSlovenia,
    Country.solomonIslands => l10n.regionSolomonislands,
    Country.somalia => l10n.regionSomalia,
    Country.southAfrica => l10n.regionSouthafrica,
    Country.southGeorgiaAndTheSouthSandwichIslands =>
      l10n.regionSouthgeorgiaandthesouthsandwichislands,
    Country.southKorea => l10n.regionSouthkorea,
    Country.southSudan => l10n.regionSouthsudan,
    Country.spain => l10n.regionSpain,
    Country.sriLanka => l10n.regionSrilanka,
    Country.sudan => l10n.regionSudan,
    Country.suriname => l10n.regionSuriname,
    Country.svalbardAndJanMayen => l10n.regionSvalbardandjanmayen,
    Country.swaziland => l10n.regionSwaziland,
    Country.sweden => l10n.regionSweden,
    Country.switzerland => l10n.regionSwitzerland,
    Country.syrianArabRepublic => l10n.regionSyrianarabrepublic,
    Country.taiwan => l10n.regionTaiwan,
    Country.tajikistan => l10n.regionTajikistan,
    Country.tanzania => l10n.regionTanzania,
    Country.thailand => l10n.regionThailand,
    Country.timorLeste => l10n.regionTimorleste,
    Country.togo => l10n.regionTogo,
    Country.tokelau => l10n.regionTokelau,
    Country.tonga => l10n.regionTonga,
    Country.trinidadAndTobago => l10n.regionTrinidadandtobago,
    Country.tunisia => l10n.regionTunisia,
    Country.turkey => l10n.regionTurkey,
    Country.turkmenistan => l10n.regionTurkmenistan,
    Country.turksAndCaicosIslands => l10n.regionTurksandcaicosislands,
    Country.tuvalu => l10n.regionTuvalu,
    Country.uganda => l10n.regionUganda,
    Country.ukraine => l10n.regionUkraine,
    Country.unitedArabEmirates => l10n.regionUnitedarabemirates,
    Country.unitedKingdom => l10n.regionUnitedkingdom,
    Country.unitedStates => l10n.regionUnitedstates,
    Country.unitedStatesMinorOutlyingIslands =>
      l10n.regionUnitedstatesminoroutlyingislands,
    Country.uruguay => l10n.regionUruguay,
    Country.usVirginIslands => l10n.regionUsvirginislands,
    Country.uzbekistan => l10n.regionUzbekistan,
    Country.vanuatu => l10n.regionVanuatu,
    Country.vaticanCity => l10n.regionVaticancity,
    Country.venezuela => l10n.regionVenezuela,
    Country.vietNam => l10n.regionVietnam,
    Country.wallisAndFutuna => l10n.regionWallisandfutuna,
    Country.westernSahara => l10n.regionWesternsahara,
    Country.yemen => l10n.regionYemen,
    Country.zambia => l10n.regionZambia,
    Country.zimbabwe => l10n.regionZimbabwe,
  };
}
