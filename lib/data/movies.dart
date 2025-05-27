import 'package:flutter/cupertino.dart';

import 'package:hmdb/utils/localization/translation_extension.dart';

class MovieModel {
  String? year;
  String? movieName;
  String? movieNameKey;
  String? movieRating;
  String? imageAsset;
  String? movieSummary;
  String? movieSummaryKey;
  String? movieTrailer;
  String? movieTrailerURL;
  String? movieWatchURL;
  final List<Map>? cast;
  final List<Map>? comments;
  final List<dynamic>? movieTags;

  MovieModel({
    this.year,
    this.movieName,
    this.movieNameKey,
    this.movieRating,
    this.imageAsset,
    this.cast,
    this.comments,
    this.movieSummary,
    this.movieSummaryKey,
    this.movieTrailer,
    this.movieTrailerURL,
    this.movieTags,
    this.movieWatchURL,
  });

  String getTranslatedName(BuildContext context) {
    try {
      if (movieNameKey != null && movieNameKey!.isNotEmpty) {
        return movieNameKey!.translate(context);
      }
    } catch (e) {
      //
    }
    return movieName ?? "";
  }

  String getTranslatedSummary(BuildContext context) {
    try {
      if (movieSummaryKey != null && movieSummaryKey!.isNotEmpty) {
        return movieSummaryKey!.translate(context);
      }
    } catch (e) {
      //
    }
    return movieSummary ?? '';
  }

  String getTranslatedRole(BuildContext context, String role,
      {String? roleKey}) {
    try {
      if (roleKey != null && roleKey.isNotEmpty) {
        return roleKey.translate(context);
      }
    } catch (e) {
      //
    }
    return role;
  }

  String getTranslatedCastName(BuildContext context, String name,
      {String? nameKey}) {
    try {
      if (nameKey != null && nameKey.isNotEmpty) {
        return nameKey.translate(context);
      }
    } catch (e) {
      //
    }
    return name;
  }
}

/// -- SHARED COMMENT FOR ALL MOVIES --
final List<Map<String, dynamic>> sharedComments = [
  {
    "name": "name_user_hossein_mahboubi",
    "imageUrl": "assets/images/main/commenters/circle_hossein.jpg",
    "date": "13 May 2025",
    "rating": "9.3",
    "comment": "comment_hossein_mahboubi",
  },
  {
    "name": "name_user_martin_scorsese",
    "imageUrl": "assets/images/main/commenters/martin_scorsese.jpg",
    "date": "13 May 2025",
    "rating": "7.0",
    "comment": "comment_martin_scorsese",
  },
  {
    "name": "name_user_john_doe",
    "imageUrl": "assets/images/main/commenters/martin_scorsese.jpg",
    "date": "22 May 2025",
    "rating": "1.0",
    "comment": "comment_john_doe",
  },
];

/// -- DATA --
final forYouImage = [
  /// -- A SEPARATION --
  MovieModel(
    imageAsset:
        "assets/images/main/personal_preference/separation/separation(cover).jpg",
    movieName: "Separation",
    movieNameKey: "movie_separation",
    year: "2011",
    movieRating: "8.3",
    movieTags: ["Drama", "Family", "Legal"],
    movieSummary:
        "A married couple are faced with a difficult decision - to improve the life of their child by moving to another country or to stay in Iran and look after a deteriorating parent who has Alzheimer's disease.",
    movieSummaryKey: "movie_separation_summary",
    cast: [
      {
        "name": "Payman Maadi",
        "nameKey": "actor_payman_maadi",
        "role": "Nader",
        "image":
            "assets/images/main/personal_preference/separation/PaymanMaadi.jpg",
      },
      {
        "name": "Leila Hatami",
        "nameKey": "actor_leyla_hatami",
        "role": "",
        "image":
            "assets/images/main/personal_preference/separation/LeilaHatami.jpg",
      },
      {
        "name": "Shahab Hosseini",
        "nameKey": "actor_shahab_hosseini",
        "role": "",
        "image":
            "assets/images/main/personal_preference/separation/Hosseini.jpg",
      },
      {
        "name": "Sareh Bayat",
        "nameKey": "actor_sareh_bayat",
        "role": "",
        "image": "assets/images/main/personal_preference/separation/Sareh.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailerURL:
        "https://www.youtube.com/watch?v=58Onuy5USTc&pp=ygUUYSBzZXBhcmF0aW9uIHRyYWlsZXI%3D",
    movieTrailer:
        "assets/images/main/personal_preference/separation/separation(cover).jpg",
    movieWatchURL:
        "https://www.uptvs.com/contents/jodaeiye-nader-az-simin.html",
  ),

  /// -- THE PRESTIGE --
  MovieModel(
    imageAsset:
        "assets/images/main/personal_preference/prestige/prestige(cover).jpg",
    movieName: "The Prestige",
    movieNameKey: "movie_the_prestige",
    year: "2006",
    movieRating: "8.5",
    movieTags: ["Mystery", "Thriller", "Period Drama"],
    movieSummary:
        "Rival 19th-century magicians engage in a bitter battle for trade secrets.",
    movieSummaryKey: "movie_the_prestige_summary",
    cast: [
      {
        "name": "Christian Bale",
        "nameKey": "actor_christian_bale",
        "role": "",
        "image":
            "assets/images/main/personal_preference/prestige/ChristianBale.jpg",
      },
      {
        "name": "Hugh Jackman",
        "nameKey": "actor_hugh_jackman",
        "role": "",
        "image":
            "assets/images/main/personal_preference/prestige/HughJackman.jpg",
      },
      {
        "name": "Michael Caine",
        "nameKey": "actor_michael_caine",
        "role": "",
        "image":
            "assets/images/main/personal_preference/prestige/MichaelCaine.jpg",
      },
      {
        "name": "Scarlett Johansson",
        "nameKey": "actor_scarlett_johansson",
        "role": "",
        "image":
            "assets/images/main/personal_preference/prestige/ScarlettJohansson.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/personal_preference/prestige/ThePrestigeMovie(trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=RLtaA9fFNXU&pp=ygUUdGhlIHByZXN0aWdlIHRyYWlsZXI%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-the-prestige-2006-%D9%BE%D8%B1%D8%B3%D8%AA%DB%8C%DA%98.html",
  ),

  /// -- ONE FLEW OVER THE CUCKOO'S NEST
  MovieModel(
      imageAsset:
          "assets/images/main/personal_preference/OneFlewOverTheCuckoo'sNest/OneFlewOverTheCuckoo'sNest(Cover).jpg",
      movieName: "One Flew Over the Cuckoo's Nest",
      movieNameKey: "movie_one_flew_over_the_cuckoo's_nest",
      year: "1975",
      movieRating: "8.7",
      movieSummary:
          "A newly admitted mental patient helps his docile companions defy the tyrannical head nurse.",
      movieSummaryKey: "movie_one_flew_over_the_cuckoo's_nest_summary",
      movieTags: ["psychological_drama", "Drama"],
      cast: [
        {
          "name": "Jack Nicholson",
          "nameKey": "actor_jack_nicholson",
          "role": "",
          "image":
              "assets/images/main/personal_preference/OneFlewOverTheCuckoo'sNest/JackNicholson.jpg",
        },
        {
          "name": "Louise Fletcher",
          "nameKey": "actor_louise_fletcher",
          "role": "",
          "image":
              "assets/images/main/personal_preference/OneFlewOverTheCuckoo'sNest/LouiseFletcher.jpg",
        },
        {
          "name": "Danny DeVito",
          "nameKey": "actor_danny_devito",
          "role": "",
          "image":
              "assets/images/main/personal_preference/OneFlewOverTheCuckoo'sNest/DannyDeVito.jpg",
        },
        {
          "name": "Peter Brocco",
          "nameKey": "actor_peter_brocco",
          "role": "",
          "image":
              "assets/images/main/personal_preference/OneFlewOverTheCuckoo'sNest/PeterBrocco.jpg",
        },
      ],
      comments: sharedComments,
      movieTrailer:
          "assets/images/main/personal_preference/OneFlewOverTheCuckoo'sNest/OneFlewOvertheCuckoo'sNest(Trailer).jpg",
      movieTrailerURL:
          "https://www.youtube.com/watch?v=OXrcDonY-B8&pp=ygUnb25lIGZsZXcgb3ZlciB0aGUgY3Vja29vJ3MgbmVzdCB0cmFpbGVy",
      movieWatchURL:
          "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-one-flew-over-the-cuckoos-nest-1975-%D8%AF%DB%8C%D9%88%D8%A7%D9%86%D9%87-%D8%A7%DB%8C-%D8%A7%D8%B2-%D9%82%D9%81%D8%B3-%D9%BE%D8%B1%DB%8C.html"),

  /// -- BRAVE HEART --
  MovieModel(
    imageAsset:
        "assets/images/main/personal_preference/BraveHeart/Braveheart(Poster).jpg",
    movieName: "Braveheart",
    movieNameKey: "movie_braveheart",
    year: "1995",
    movieRating: "8.3",
    movieTags: ["Epic", "Drama", "War"],
    movieSummary:
        "Scottish warrior William Wallace leads his countrymen in a rebellion to free his homeland from the tyranny of King Edward I of England.",
    movieSummaryKey: "movie_braveheart_summary",
    cast: [
      {
        "name": "Mel Gibson",
        "nameKey": "actor_mel_gibson",
        "role": "",
        "image":
            "assets/images/main/personal_preference/BraveHeart/MelGibson.jpg",
      },
      {
        "name": "Sophie Marceau",
        "nameKey": "actor_sophie_marceau",
        "role": "",
        "image":
            "assets/images/main/personal_preference/BraveHeart/SophieMarceau.jpg",
      },
      {
        "name": "James Cosmo",
        "nameKey": "actor_james_cosmo",
        "role": "",
        "image":
            "assets/images/main/personal_preference/BraveHeart/JamesCosmo.jpg",
      },
      {
        "name": "Angus Macfadyen",
        "nameKey": "actor_angus_macfadyen",
        "role": "",
        "image":
            "assets/images/main/personal_preference/BraveHeart/AngusMacfadyen.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/personal_preference/BraveHeart/Braveheart(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=1NJO0jxBtMo&pp=ygUSQnJhdmVoZWFydCB0cmFpbGVy",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-braveheart-1995-%D8%B4%D8%AC%D8%A7%D8%B9-%D8%AF%D9%84-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8%D9%84%D9%87-%D9%81%D8%A7%D8%B1%D8%B3%DB%8C.html",
  ),
];

final popularImages = [
  /// -- THE SHAWSHANK REDEMPTION --
  MovieModel(
      imageAsset:
          "assets/images/main/popular_movies/TheShawshankRedemption/TheShawshankRedemption(Cover).jpg",
      movieName: "The Shawshank Redemption",
      movieNameKey: "movie_the_shawshank_redemption",
      year: "1994",
      movieRating: "9.3",
      movieTags: [
        "Epic",
        "Drama",
      ],
      movieSummary:
          "A banker convicted of uxoricide forms a friendship over a quarter century with a hardened convict, while maintaining his innocence and trying to remain hopeful through simple compassion.",
      movieSummaryKey: "movie_the_shawshank_redemption_summary",
      cast: [
        {
          "name": "Tim Robbins",
          "nameKey": "actor_tim_robbins",
          "role": "Andy Dufresne",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/TimRobbins.jpg",
        },
        {
          "name": "Morgan Freeman",
          "nameKey": "actor_morgan_freeman",
          "role": "Ellis Boyd 'Red' Redding",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/MorganFreeman.jpg",
        },
        {
          "name": "Bob Gunton",
          "nameKey": "actor_bob_gunton",
          "role": "Warden Norton",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/BobGunton.jpg",
        },
        {
          "name": "Clancy Brown",
          "nameKey": "actor_clancy_brown",
          "role": "Captain Hadley",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/ClancyBrown.jpg",
        },
      ],
      comments: sharedComments,
      movieTrailer:
          "assets/images/main/popular_movies/TheShawshankRedemption/TheShawshankRedemption(Trailer).jpg",
      movieTrailerURL:
          "https://www.youtube.com/watch?v=PLl99DlL6b4&pp=ygUgdGhlIHNoYXdzaGFuayByZWRlbXB0aW9uIHRyYWlsZXLSBwkJhgkBhyohjO8%3D",
      movieWatchURL:
          "https://www.uptvs.com/contents/the-shawshank-redemption-1994.html"),

  /// -- THE GODFATHER 1 --
  MovieModel(
    imageAsset:
        "assets/images/main/popular_movies/TheGodfather1/TheGodfather(Cover).jpg",
    movieName: "Godfather 1",
    movieNameKey: "movie_the_godfather",
    year: "1972",
    movieRating: "9.2",
    movieTags: ["Epic", "Tragedy", "Crime", "Drama"],
    movieSummary:
        "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
    movieSummaryKey: "movie_the_godfather_summary",
    cast: [
      {
        "name": "Marlon Brando",
        "nameKey": "actor_marlon_brando",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather1/MarlonBrando.jpg",
      },
      {
        "name": "Al Pacino",
        "nameKey": "actor_al_pacino",
        "role": "",
        "image": "assets/images/main/popular_movies/TheGodfather1/AlPacino.jpg",
      },
      {
        "name": "James Caan",
        "nameKey": "actor_james_caan",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather1/JamesCaan.jpg",
      },
      {
        "name": "Diana Keaton",
        "nameKey": "actor_diana_keaton",
        "role": "Lady Jessica",
        "image":
            "assets/images/main/popular_movies/TheGodfather1/DianeKeaton.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/popular_movies/TheGodfather1/TheGodfather(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=sY1S34973zA&pp=ygUXdGhlIGdvZGZhdGhlciAxIHRyYWlsZXLSBwkJhgkBhyohjO8%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-%D9%BE%D8%AF%D8%B1%D8%AE%D9%88%D8%A7%D9%86%D8%AF%D9%87-the-godfather-1972-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8%D9%84%D9%87-%D9%81%D8%A7%D8%B1.html",
  ),

  /// -- THE DARK KNIGHT --
  MovieModel(
    imageAsset:
        "assets/images/main/popular_movies/TheDarkKnight/TheDarkKnight(Cover).jpg",
    movieName: "The Dark Knight",
    movieNameKey: "movie_the_dark_knight",
    year: "2008",
    movieRating: "9.0",
    movieTags: ["Action", "Epic", "Drama", "Tragedy"],
    movieSummary:
        "When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.",
    movieSummaryKey: "movie_the_dark_knight_summary",
    cast: [
      {
        "name": "Christian Bale",
        "nameKey": "actor_christian_bale",
        "role": "BATMAN",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/ChristianBale.jpg",
      },
      {
        "name": "Heath Ledger",
        "nameKey": "actor_heath_ledger",
        "role": "Joker",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/HeathLedger.jpg",
      },
      {
        "name": "Michael Caine",
        "nameKey": "actor_michael_caine",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/MichaelCaine.jpg",
      },
      {
        "name": "Aaron Eckhart",
        "nameKey": "actor_aaron_eckhart",
        "role": "Lady Jessica",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/AaronEckhart.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/popular_movies/TheDarkKnight/TheDarkKnight(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=EXeTwQWrcwY&pp=ygUXVGhlIERhcmsgS25pZ2h0IHRyYWlsZXI%3D",
    movieWatchURL: "https://www.uptvs.com/contents/the-dark-knight-2008.html",
  ),

  /// -- THE GODFATHER 2 --
  MovieModel(
    imageAsset:
        "assets/images/main/popular_movies/TheGodfather2/TheGodfather2(Cover).jpg",
    movieName: "Godfather 2",
    movieNameKey: "movie_the_godfather_2",
    year: "1974",
    movieRating: "9.0",
    movieTags: ["Epic", "Tragedy", "Crime", "Drama"],
    movieSummary:
        "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
    movieSummaryKey: "movie_the_godfather_2_summary",
    cast: [
      {
        "name": "Al Pacino",
        "nameKey": "actor_al_pacino",
        "role": "",
        "image": "assets/images/main/popular_movies/TheGodfather2/AlPacino.jpg",
      },
      {
        "name": "Robert De Niro",
        "nameKey": "actor_robert_de_niro",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather2/RobertdeNiro.jpg",
      },
      {
        "name": "Robert Duvall",
        "nameKey": "actor_robert_duvall",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather2/RobertDuvall.jpg",
      },
      {
        "name": "Diana Keaton",
        "nameKey": "actor_diana_keaton",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather2/DianeKeaton.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/popular_movies/TheGodfather2/TheGodfather2(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=9O1Iy9od7-A&pp=ygUXVGhlIEdvZGZhdGhlciAyIHRyYWlsZXI%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-the-godfather-2-1974-%D9%BE%D8%AF%D8%B1%D8%AE%D9%88%D8%A7%D9%86%D8%AF%D9%87-2-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8%D9%84%D9%87-%D9%81%D8%A7.html",
  ),
];

final top250imdb = [
  /// -- THE SHAWSHANK REDEMPTION --
  MovieModel(
      imageAsset:
          "assets/images/main/popular_movies/TheShawshankRedemption/TheShawshankRedemption(Cover).jpg",
      movieName: "The Shawshank Redemption",
      movieNameKey: "movie_the_shawshank_redemption",
      year: "1994",
      movieRating: "9.3",
      movieTags: [
        "Epic",
        "Drama",
      ],
      movieSummary:
          "A banker convicted of uxoricide forms a friendship over a quarter century with a hardened convict, while maintaining his innocence and trying to remain hopeful through simple compassion.",
      movieSummaryKey: "movie_the_shawshank_redemption_summary",
      cast: [
        {
          "name": "Tim Robbins",
          "nameKey": "actor_tim_robbins",
          "role": "Andy Dufresne",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/TimRobbins.jpg",
        },
        {
          "name": "Morgan Freeman",
          "nameKey": "actor_morgan_freeman",
          "role": "Ellis Boyd 'Red' Redding",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/MorganFreeman.jpg",
        },
        {
          "name": "Bob Gunton",
          "nameKey": "actor_bob_gunton",
          "role": "Warden Norton",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/BobGunton.jpg",
        },
        {
          "name": "Clancy Brown",
          "nameKey": "actor_clancy_brown",
          "role": "Captain Hadley",
          "image":
              "assets/images/main/popular_movies/TheShawshankRedemption/ClancyBrown.jpg",
        },
      ],
      comments: sharedComments,
      movieTrailer:
          "assets/images/main/popular_movies/TheShawshankRedemption/TheShawshankRedemption(Trailer).jpg",
      movieTrailerURL:
          "https://www.youtube.com/watch?v=PLl99DlL6b4&pp=ygUgdGhlIHNoYXdzaGFuayByZWRlbXB0aW9uIHRyYWlsZXLSBwkJhgkBhyohjO8%3D",
      movieWatchURL:
          "https://www.uptvs.com/contents/the-shawshank-redemption-1994.html"),

  /// -- THE GODFATHER 1 --
  MovieModel(
    imageAsset:
        "assets/images/main/popular_movies/TheGodfather1/TheGodfather(Cover).jpg",
    movieName: "Godfather 1",
    movieNameKey: "movie_the_godfather",
    year: "1972",
    movieRating: "9.2",
    movieTags: ["Epic", "Tragedy", "Crime", "Drama"],
    movieSummary:
        "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
    movieSummaryKey: "movie_the_godfather_summary",
    cast: [
      {
        "name": "Marlon Brando",
        "nameKey": "actor_marlon_brando",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather1/MarlonBrando.jpg",
      },
      {
        "name": "Al Pacino",
        "nameKey": "actor_al_pacino",
        "role": "",
        "image": "assets/images/main/popular_movies/TheGodfather1/AlPacino.jpg",
      },
      {
        "name": "James Caan",
        "nameKey": "actor_james_caan",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather1/JamesCaan.jpg",
      },
      {
        "name": "Diana Keaton",
        "nameKey": "actor_diana_keaton",
        "role": "Lady Jessica",
        "image":
            "assets/images/main/popular_movies/TheGodfather1/DianeKeaton.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/popular_movies/TheGodfather1/TheGodfather(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=sY1S34973zA&pp=ygUXdGhlIGdvZGZhdGhlciAxIHRyYWlsZXLSBwkJhgkBhyohjO8%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-%D9%BE%D8%AF%D8%B1%D8%AE%D9%88%D8%A7%D9%86%D8%AF%D9%87-the-godfather-1972-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8%D9%84%D9%87-%D9%81%D8%A7%D8%B1.html",
  ),

  /// -- THE DARK KNIGHT --
  MovieModel(
    imageAsset:
        "assets/images/main/popular_movies/TheDarkKnight/TheDarkKnight(Cover).jpg",
    movieName: "The Dark Knight",
    movieNameKey: "movie_the_dark_knight",
    year: "2008",
    movieRating: "9.0",
    movieTags: ["Action", "Epic", "Drama", "Tragedy"],
    movieSummary:
        "When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.",
    movieSummaryKey: "movie_the_dark_knight_summary",
    cast: [
      {
        "name": "Christian Bale",
        "nameKey": "actor_christian_bale",
        "role": "BATMAN",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/ChristianBale.jpg",
      },
      {
        "name": "Heath Ledger",
        "nameKey": "actor_heath_ledger",
        "role": "Joker",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/HeathLedger.jpg",
      },
      {
        "name": "Michael Caine",
        "nameKey": "actor_michael_caine",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/MichaelCaine.jpg",
      },
      {
        "name": "Aaron Eckhart",
        "nameKey": "actor_aaron_eckhart",
        "role": "Lady Jessica",
        "image":
            "assets/images/main/popular_movies/TheDarkKnight/AaronEckhart.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/popular_movies/TheDarkKnight/TheDarkKnight(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=EXeTwQWrcwY&pp=ygUXVGhlIERhcmsgS25pZ2h0IHRyYWlsZXI%3D",
    movieWatchURL: "https://www.uptvs.com/contents/the-dark-knight-2008.html",
  ),

  /// -- THE GODFATHER 2 --
  MovieModel(
    imageAsset:
        "assets/images/main/popular_movies/TheGodfather2/TheGodfather2(Cover).jpg",
    movieName: "Godfather 2",
    movieNameKey: "movie_the_godfather_2",
    year: "1974",
    movieRating: "9.0",
    movieTags: ["Epic", "Tragedy", "Crime", "Drama"],
    movieSummary:
        "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
    movieSummaryKey: "movie_the_godfather_2_summary",
    cast: [
      {
        "name": "Al Pacino",
        "nameKey": "actor_al_pacino",
        "role": "",
        "image": "assets/images/main/popular_movies/TheGodfather2/AlPacino.jpg",
      },
      {
        "name": "Robert De Niro",
        "nameKey": "actor_robert_de_niro",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather2/RobertdeNiro.jpg",
      },
      {
        "name": "Robert Duvall",
        "nameKey": "actor_robert_duvall",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather2/RobertDuvall.jpg",
      },
      {
        "name": "Diana Keaton",
        "nameKey": "actor_diana_keaton",
        "role": "",
        "image":
            "assets/images/main/popular_movies/TheGodfather2/DianeKeaton.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/popular_movies/TheGodfather2/TheGodfather2(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=9O1Iy9od7-A&pp=ygUXVGhlIEdvZGZhdGhlciAyIHRyYWlsZXI%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-the-godfather-2-1974-%D9%BE%D8%AF%D8%B1%D8%AE%D9%88%D8%A7%D9%86%D8%AF%D9%87-2-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8%D9%84%D9%87-%D9%81%D8%A7.html",
  ),

  /// -- 12 ANGRY MAN --
  MovieModel(
    imageAsset: "assets/images/main/imdb250/12AngryMan/12AngyMan(Cover).jpg",
    movieName: "12 Angry Man",
    movieNameKey: "movie_12_angry_man",
    year: "1957",
    movieRating: "9.0",
    movieTags: ["legal_drama", "Crime", "Drama"],
    movieSummary:
        "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.",
    movieSummaryKey: "movie_12_angry_man_summary",
    cast: [
      {
        "name": "Henry Fonda",
        "nameKey": "actor_henry_fonda",
        "role": "",
        "image": "assets/images/main/imdb250/12AngryMan/HenryFonda.jpg",
      },
      {
        "name": "Lee J. Cobb",
        "nameKey": "actor_lee_cobb",
        "role": "",
        "image": "assets/images/main/imdb250/12AngryMan/LeeCobb.jpg",
      },
      {
        "name": "Martin Balsam",
        "nameKey": "actor_martin_balsam",
        "role": "",
        "image": "assets/images/main/imdb250/12AngryMan/MartinBalsam.jpg",
      },
      {
        "name": "John Fiedler",
        "nameKey": "actor_john_fiedler",
        "role": "",
        "image": "assets/images/main/imdb250/12AngryMan/JohnFiedler.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/imdb250/12AngryMan/12AngryMan(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=TEN-2uTi2c0&pp=ygUUMTIgQW5ncnkgbWFuIHRyYWlsZXLSBwkJjQkBhyohjO8%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-12-%D9%85%D8%B1%D8%AF-%D8%AE%D8%B4%D9%85%DA%AF%DB%8C%D9%86-12angry-men-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8%D9%84%D9%87-%D9%81%D8%A7.html",
  ),

  /// -- LOTR : THE RETURN OF THE KING --
  MovieModel(
    imageAsset:
        "assets/images/main/imdb250/LOTR_TheReturnOfTheKing/TheReturnOfTheKing(Cover).jpg",
    movieName: "The Return of the King",
    movieNameKey: "movie_the_return_the_king",
    year: "2003",
    movieRating: "9.0",
    movieTags: ["Epic", "Fantasy", "Drama"],
    movieSummary:
        "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
    movieSummaryKey: "movie_the_return_of_the_king_summary",
    cast: [
      {
        "name": "Elijah Wood",
        "nameKey": "actor_elijah_wood",
        "role": "",
        "image":
            "assets/images/main/imdb250/LOTR_TheReturnOfTheKing/ElijahWood.jpg",
      },
      {
        "name": "Viggo Mortensen",
        "nameKey": "actor_viggo_mortensen",
        "role": "",
        "image":
            "assets/images/main/imdb250/LOTR_TheReturnOfTheKing/ViggoMortensen.jpg",
      },
      {
        "name": "Ian McKellen",
        "nameKey": "actor_ian_mckellen",
        "role": "",
        "image":
            "assets/images/main/imdb250/LOTR_TheReturnOfTheKing/IanMcKellen.jpg",
      },
      {
        "name": "Orlando Bloom",
        "nameKey": "actor_orlando_bloom",
        "role": "",
        "image":
            "assets/images/main/imdb250/LOTR_TheReturnOfTheKing/OrlandoBloom.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/imdb250/LOTR_TheReturnOfTheKing/TheReturnOfTheKing(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=r5X-hFf6Bwo&pp=ygUeVGhlIFJldHVybiBvZiB0aGUga2luZyB0cmFpbGVy",
    movieWatchURL:
        "https://www.uptvs.com/contents/the-lord-of-the-rings-the-return-of-the-king-2003.html",
  ),

  /// -- SCHINDLER'S LIST --
  MovieModel(
    imageAsset:
        "assets/images/main/imdb250/Schindler'sList/Schindler'sList(Cover2).jpg",
    movieName: "Schindler's List",
    movieNameKey: "movie_schindler's_list",
    year: "1993",
    movieRating: "9.0",
    movieTags: ["Epic", "Tragedy", "Drama"],
    movieSummary:
        "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
    movieSummaryKey: "movie_schindler's_list_summary",
    cast: [
      {
        "name": "Liam Neeson",
        "nameKey": "actor_liam_neeson",
        "role": "",
        "image": "assets/images/main/imdb250/Schindler'sList/LiamNeeson.jpg",
      },
      {
        "name": "Ralph Fiennes",
        "nameKey": "actor_ralph_fiennes",
        "role": "",
        "image": "assets/images/main/imdb250/Schindler'sList/RalphFiennes.jpg",
      },
      {
        "name": "Ben Kingsley",
        "nameKey": "actor_ben_kingsley",
        "role": "",
        "image": "assets/images/main/imdb250/Schindler'sList/BenKingsley.jpg",
      },
      {
        "name": "Caroline Goodall",
        "nameKey": "actor_caroline_goodall",
        "role": "",
        "image":
            "assets/images/main/imdb250/Schindler'sList/CarolineGoodall.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/imdb250/Schindler'sList/Schindler'sList(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=mxphAlJID9U&pp=ygUWU2NoaW5kbGVyIGxpc3QgdHJhaWxlcg%3D%3D",
    movieWatchURL: "https://www.uptvs.com/contents/schindlers-list-1993.html",
  ),
];

final persianMovieImages = [
  /// -- ABOUT ELLY --
  MovieModel(
    imageAsset:
        "assets/images/main/persian_movies/AboutElly/AboutElly(Cover).jpg",
    movieName: "About Elly",
    movieNameKey: "movie_about_elly_name",
    year: "2009",
    movieRating: "7.9",
    movieTags: ["Drama", "Mystery"],
    movieSummary:
        "The mysterious disappearance of a kindergarten teacher during a picnic in the north of Iran is followed by a series of misadventures for her fellow travelers.",
    movieSummaryKey: "movie_about_elly_summary",
    cast: [
      {
        "name": "Payman Maadi",
        "nameKey": "actor_payman_maadi",
        "role": "",
        "image": "assets/images/main/persian_movies/AboutElly/PaymanMaadi.jpg",
      },
      {
        "name": "Shahab Hosseini",
        "nameKey": "actor_shahab_hosseini",
        "role": "",
        "image": "assets/images/main/persian_movies/AboutElly/Hosseini.jpg",
      },
      {
        "name": "Taraneh Alidoosti",
        "nameKey": "actor_taraneh_alidoosti",
        "role": "",
        "image":
            "assets/images/main/persian_movies/AboutElly/TaranehAlidoosti.jpg",
      },
      {
        "name": "Golshifteh Farahani",
        "nameKey": "actor_golshifteh_farahani",
        "role": "",
        "image":
            "assets/images/main/persian_movies/AboutElly/GolshiftehFarahani.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/persian_movies/AboutElly/AboutElly(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=MdqMICWhxuA&pp=ygUSYWJvdXQgZWxseSB0cmFpbGVy",
    movieWatchURL:
        "https://www.uptvs.com/contents/download-full-movie-about-elly.html",
  ),

  /// --  LEILA'S BROTHERS --
  MovieModel(
    imageAsset:
        "assets/images/main/persian_movies/Leila'sBrothers/Leila'sBrothers(Cover).jpg",
    movieName: "Leila's Brothers",
    movieNameKey: "movie_leilas_brothers",
    year: "2022",
    movieRating: "7.9",
    movieTags: ["Drama"],
    movieSummary:
        "Leila, who has spent her entire life caring for her family, makes a plan as her brothers are struggling to make ends meet.",
    movieSummaryKey: "movie_leilas_brothers_summary",
    cast: [
      {
        "name": "Payman Maadi",
        "nameKey": "actor_payman_maadi",
        "role": "",
        "image":
            "assets/images/main/persian_movies/Leila'sBrothers/PaymanMaadi.jpg",
      },
      {
        "name": "Navid Mohammadzadeh",
        "nameKey": "actor_navid_mohammadzadeh",
        "role": "",
        "image":
            "assets/images/main/persian_movies/Leila'sBrothers/NavidMohammadzade.jpg",
      },
      {
        "name": "Taraneh Alidoosti",
        "nameKey": "actor_taraneh_alidoosti",
        "role": "",
        "image":
            "assets/images/main/persian_movies/Leila'sBrothers/TaranehAlidoosti.jpg",
      },
      {
        "name": "Saeed Poursamimi",
        "nameKey": "actor_saeed_poursamimi",
        "role": "",
        "image":
            "assets/images/main/persian_movies/Leila'sBrothers/SaeedPoursamimi.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/persian_movies/Leila'sBrothers/Leila'sBrothers(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=mlBuFgvYWDY&pp=ygUYTGVpbGEncyBicm90aGVycyB0cmFpbGVy0gcJCYYJAYcqIYzv",
    movieWatchURL:
        "https://hamtamovie.net/%d8%af%d8%a7%d9%86%d9%84%d9%88%d8%af-%d8%b1%d8%a7%db%8c%da%af%d8%a7%d9%86-%d9%81%db%8c%d9%84%d9%85-%d8%a8%d8%b1%d8%a7%d8%af%d8%b1%d8%a7%d9%86-%d9%84%db%8c%d9%84%d8%a7/",
  ),

  /// -- THE FROG --
  MovieModel(
    imageAsset: "assets/images/main/persian_movies/TheFrog/TheFrog(Cover).jpg",
    movieName: "The Frog",
    movieNameKey: "movie_the_frog",
    year: "2020/21",
    movieRating: "8.1",
    movieTags: ["Drama", "Crime", "Mystery"],
    movieSummary:
        "Ramin plans a robbery on his childhood classmate Noori who has become a mysterious rich man and that's just a beginning of a brutal journey.",
    movieSummaryKey: "movie_the_frog_summary",
    cast: [
      {
        "name": "Navid Mohammadzade",
        "nameKey": "actor_navid_mohammadzadeh",
        "role": "",
        "image":
            "assets/images/main/persian_movies/TheFrog/NavidMohammadzade.jpg",
      },
      {
        "name": "Saber Abar",
        "nameKey": "actor_saber_abar",
        "role": "",
        "image": "assets/images/main/persian_movies/TheFrog/SaberAbar.jpg",
      },
      {
        "name": "Sahar Dolatshahi",
        "nameKey": "actor_sahar_dolatshahi",
        "role": "",
        "image":
            "assets/images/main/persian_movies/TheFrog/SaharDolatshahi.jpg",
      },
      {
        "name": "Fereshte Hosseini",
        "nameKey": "actor_fereshte_hosseini",
        "role": "",
        "image":
            "assets/images/main/persian_movies/TheFrog/FereshteHosseini.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/persian_movies/TheFrog/TheFrog(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=ci0LkEwl5-Y&pp=ygUfdGhlIGZyb2cgaXJhbmlhbiBzZXJpZXMgdHJhaWxlcg%3D%3D",
    movieWatchURL:
        "https://hamtamovie.net/%D8%B3%D8%B1%DB%8C%D8%A7%D9%84-%D9%82%D9%88%D8%B1%D8%A8%D8%A7%D8%BA%D9%87/",
  ),

  /// -- MORTAL WOUND --
  MovieModel(
    imageAsset:
        "assets/images/main/persian_movies/MortalWound/MortalWound(Cover).jpg",
    movieName: "Mortal Wound",
    movieNameKey: "movie_mortal_wound",
    year: "2021/25",
    movieRating: "7.1",
    movieTags: ["Drama", "Crime", "Mystery"],
    movieSummary:
        "Story of drama, love, and crime among relatives all connected through a huge holding company.",
    movieSummaryKey: "movie_mortal_wound_summary",
    cast: [
      {
        "name": "Javad Ezati",
        "nameKey": "actor_javad_ezati",
        "role": "",
        "image": "assets/images/main/persian_movies/MortalWound/JavadEzati.jpg",
      },
      {
        "name": "Ra'na Azadivar",
        "nameKey": "actor_ra'na_azadivar",
        "role": "",
        "image":
            "assets/images/main/persian_movies/MortalWound/Ra'naAzadivar.jpg",
      },
      {
        "name": "Mehraveh Sharifinia",
        "nameKey": "actor_mehraveh_sharifinia",
        "role": "",
        "image":
            "assets/images/main/persian_movies/MortalWound/MehravehSharifinia.jpg",
      },
      {
        "name": "Kambiz Dirbaz",
        "nameKey": "actor_kambiz_dirbaz",
        "role": "",
        "image":
            "assets/images/main/persian_movies/MortalWound/KambizDirbaz.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/persian_movies/MortalWound/MortalWound(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=InL6K5d-7xQ&pp=ygUbTW9ydGFsIHdvdW5kIHNlcmllcyB0cmFpbGVy",
    movieWatchURL: "https://www.filimo.com/asparagus/m/85436",
  ),

  // -- LAW OF TEHRAN  --
  MovieModel(
    imageAsset:
        "assets/images/main/persian_movies/LawOfTehran/LawOfTehran(Cover).jpg",
    movieName: "Law of Tehran",
    movieNameKey: "movie_law_of_tehran",
    year: "2021",
    movieRating: "7.1",
    movieTags: ["Drama", "Crime", "Action"],
    movieSummary:
        "The police are after a drug lord named Naser Khakzad, but when they finally manage to catch him, he tries whatever he can think of to escape and save his family.",
    movieSummaryKey: "movie_law_of_tehran_summary",
    cast: [
      {
        "name": "Payman Maadi",
        "nameKey": "actor_payman_maadi",
        "role": "",
        "image":
            "assets/images/main/persian_movies/LawOfTehran/PaymanMaadi.jpg",
      },
      {
        "name": "Navid Mohammadzadeh",
        "nameKey": "actor_navid_mohammadzadeh",
        "role": "",
        "image":
            "assets/images/main/persian_movies/LawOfTehran/NavidMohammadzade.jpg",
      },
      {
        "name": "Parinaz Izadyar",
        "nameKey": "actor_parinaz_izadyar",
        "role": "",
        "image":
            "assets/images/main/persian_movies/LawOfTehran/ParinazIzadyar.jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/persian_movies/LawOfTehran/LawOfTehran(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=L4UTOtSaOzU&pp=ygUZVGhlIExhdyBvZiBUZWhyYW4gdHJhaWxlcg%3D%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D9%81%DB%8C%D9%84%D9%85-%D9%85%D8%AA%D8%B1%DB%8C-%D8%B4%DB%8C%D8%B4-%D9%88-%D9%86%DB%8C%D9%85-%D8%A8%D8%A7-%DA%A9%DB%8C%D9%81%DB%8C%D8%AA-4k.html",
  ),
];

final animationImages = [
  // -- THE EMPEROR'S NEW GROOVE --
  MovieModel(
    imageAsset:
        "assets/images/main/animations/TheEmperor'sNewGroove/TheEmperorsNewGroove(Cover).jpg",
    movieName: "The Emperor's New Groove",
    movieNameKey: "movie_emperors_new_groove",
    year: "2000",
    movieRating: "7.4",
    movieTags: ["Animation"],
    movieSummary:
        "Emperor Kuzco is turned into a llama by his ex-administrator Yzma, and must now regain his throne and his human form with the help of Pacha, a gentle llama herder.",
    movieSummaryKey: "movie_emperors_new_groove_summary",
    cast: [
      {
        "name": "David Spade",
        "nameKey": "actor_david_spade",
        "role": "Kuzco",
        "image":
            "assets/images/main/animations/TheEmperor'sNewGroove/DavidSpade(Kuzco).jpg",
      },
      {
        "name": "John Goodman",
        "nameKey": "actor_john_goodman",
        "role": "Pacha",
        "image":
            "assets/images/main/animations/TheEmperor'sNewGroove/JohnGoodman(Pacha).jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/animations/TheEmperor'sNewGroove/TheEmperor'sNewGroove(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=r5tWkRmrHDA&pp=ygUgVGhlIEVtcGVyb3IncyBOZXcgR3Jvb3ZlIHRyYWlsZXI%3D",
    movieWatchURL:
        "https://www.doostihaa.com/post/1393/08/05/the-emperors-new-groove-2000-farsi-dubbed.html",
  ),

  /// -- STAR WARS - THE CLONE WARS --
  MovieModel(
    imageAsset:
        "assets/images/main/animations/StarWarsTheCloneWars/TheCloneWars(Cover).jpg",
    movieName: "The Clone Wars",
    movieNameKey: "movie_star_wars_clone_wars",
    year: "2008",
    movieRating: "8.4",
    movieTags: ["Sci-Fi", "Fantasy", "Animation"],
    movieSummary:
        "Jedi Knights lead the Grand Army of the Republic against the droid army of the Separatists.",
    movieSummaryKey: "movie_star_wars_clone_wars_summary",
    cast: [
      {
        "name": "Tom Kane",
        "nameKey": "actor_tom_kane",
        "role": "Narrator",
        "image":
            "assets/images/main/animations/StarWarsTheCloneWars/TomKane(Narrator).jpg",
      },
      {
        "name": "Matt Lanter",
        "nameKey": "actor_matt_lanter",
        "role": "Anakin Skywalker",
        "image":
            "assets/images/main/animations/StarWarsTheCloneWars/MattLanter(AnakinSkywalker).jpg",
      },
      {
        "name": "James Arnold Taylor",
        "nameKey": "actor_james_arnold_taylor",
        "role": "Obi-Wan Kenobi",
        "image":
            "assets/images/main/animations/StarWarsTheCloneWars/JamesArnoldTaylor(Obi-WanKenobi).jpg",
      },
      {
        "name": "Ashley Eckstein",
        "nameKey": "actor_ashley_eckstein",
        "role": "Ahsoka Tano",
        "image":
            "assets/images/main/animations/StarWarsTheCloneWars/AshleyEckstein(Ahsoka).jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/animations/StarWarsTheCloneWars/TheCloneWars(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=ZLW2jkd6E7g&pp=ygUhU3RhciBXYXJzIFRoZSBjbG9uZSB3YXJzICB0cmFpbGVy",
    movieWatchURL:
        "https://ir-dl.com/cartoons-and-animation/star-wars-the-clone-wars-2008-2/",
  ),

  // -- SHREK --
  MovieModel(
    imageAsset: "assets/images/main/animations/Shrek/Shrek(Cover).jpg",
    movieName: "Shrek",
    movieNameKey: "movie_shrek",
    year: "2001",
    movieRating: "7.9",
    movieTags: ["Animation"],
    movieSummary:
        "A mean lord exiles fairytale creatures to the swamp of a grumpy ogre, who must go on a quest and rescue a princess for the lord in order to get his land back.",
    movieSummaryKey: "movie_shrek_summary",
    cast: [
      {
        "name": "Mike Myers",
        "nameKey": "actor_mike_myers",
        "role": "Shrek",
        "image": "assets/images/main/animations/Shrek/MikeMyers(Shrek).jpg",
      },
      {
        "name": "Eddie Murphy",
        "nameKey": "actor_eddie_murphy",
        "role": "Donkey",
        "image": "assets/images/main/animations/Shrek/EddieMurphy(Donkey).jpg",
      },
      {
        "name": "Cameron Diaz",
        "nameKey": "actor_cameron_diaz",
        "role": "Fiona",
        "image": "assets/images/main/animations/Shrek/CameronDiaz(Fiona).jpg",
      },
      {
        "name": "Vincent Cassel",
        "nameKey": "actor_vincent_cassel",
        "role": "Hood",
        "image": "assets/images/main/animations/Shrek/VincentCassel(Hood).jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer: "assets/images/main/animations/Shrek/Shrek(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=CwXOrWvPBPk&pp=ygUQU2hyZWsgMSAgdHJhaWxlcg%3D%3D",
    movieWatchURL:
        "https://www.doostihaa.com/post/1392/12/15/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D8%A7%D9%86%DB%8C%D9%85%DB%8C%D8%B4%D9%86-%D8%B4%D8%B1%DA%A9-1-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8%D9%84%D9%87-%D9%81%D8%A7%D8%B1%D8%B3%DB%8C.html",
  ),

  // -- FINDING NEMO --
  MovieModel(
    imageAsset:
        "assets/images/main/animations/FindingNemo/FindingNemo(Cover).jpg",
    movieName: "Finding Nemo",
    movieNameKey: "movie_finding_nemo",
    year: "2003",
    movieRating: "8.2",
    movieTags: ["Animation"],
    movieSummary:
        "After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.",
    movieSummaryKey: "movie_finding_nemo_summary",
    cast: [
      {
        "name": "Albert Brooks",
        "nameKey": "actor_albert_brooks",
        "role": "Marlin",
        "image":
            "assets/images/main/animations/FindingNemo/AlbertBrooks(Marlin).jpg",
      },
      {
        "name": "Ellen DeGeneres",
        "nameKey": "actor_ellen_de_generes",
        "role": "Dory",
        "image":
            "assets/images/main/animations/FindingNemo/EllenDeGeneres(Dory).jpg",
      },
      {
        "name": "Alexander Gould",
        "nameKey": "actor_alexander_gould",
        "role": "Nemo",
        "image":
            "assets/images/main/animations/FindingNemo/AlexanderGould(Nemo).jpg",
      },
      {
        "name": "Willem Dafoe",
        "nameKey": "actor_willem_dafoe",
        "role": "Gill",
        "image":
            "assets/images/main/animations/FindingNemo/WillemDafoe(Gill).jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/animations/FindingNemo/FindingNemo(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=9oQ628Seb9w&pp=ygUURmluZGluZyBOZW1vIHRyYWlsZXI%3D",
    movieWatchURL:
        "https://www.uptvs.com/contents/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%D8%A7%D9%86%DB%8C%D9%85%DB%8C%D8%B4%D9%86-%D8%AF%D8%B1-%D8%AC%D8%B3%D8%AA%D8%AC%D9%88%DB%8C-%D9%86%D9%85%D9%88-finding-nemo-2003-%D8%A8%D8%A7-%D8%AF%D9%88%D8%A8.html",
  ),

  // -- RATATOUILLE --
  MovieModel(
    imageAsset:
        "assets/images/main/animations/Ratatouille/Ratatouille(Cover).jpg",
    movieName: "Ratatouille",
    movieNameKey: "movie_ratatouille",
    year: "2007",
    movieRating: "8.1",
    movieTags: ["Animation"],
    movieSummary:
        "A rat who can cook makes an unusual alliance with a young kitchen worker at a famous Paris restaurant.",
    movieSummaryKey: "movie_ratatouille_summary",
    cast: [
      {
        "name": "Brad Garrett",
        "nameKey": "actor_brad_garrett",
        "role": "Gusteau",
        "image":
            "assets/images/main/animations/Ratatouille/BradGarrett(Gusteau),jpg.jpg",
      },
      {
        "name": "Lou Romano",
        "nameKey": "actor_lou_romano",
        "role": "Linguini",
        "image":
            "assets/images/main/animations/Ratatouille/LouRomano(Linguini).jpg",
      },
      {
        "name": "Patto Oswalt",
        "nameKey": "actor_patto_oswalt",
        "role": "Remy",
        "image":
            "assets/images/main/animations/Ratatouille/PattoOswalt(Remy).jpg",
      },
      {
        "name": "Ian Holm",
        "nameKey": "actor_ian_holms",
        "role": "Skinner",
        "image":
            "assets/images/main/animations/Ratatouille/IanHolm(Skinner).jpg",
      },
    ],
    comments: sharedComments,
    movieTrailer:
        "assets/images/main/animations/Ratatouille/Ratatouille(Trailer).jpg",
    movieTrailerURL:
        "https://www.youtube.com/watch?v=NgsQ8mVkN8w&pp=ygUTcmF0YXRvdWlsbGUgdHJhaWxlcg%3D%3D",
    movieWatchURL:
        "https://www.doostihaa.com/post/1393/06/22/ratatouille-2007-farsi-dubbed.html",
  ),
];

final genresList = [
  MovieModel(
      movieName: "Horror", imageAsset: "assets/images/main/genres/horror1.jpg"),
  MovieModel(
      movieName: "Fantasy",
      imageAsset: "assets/images/main/genres/fantasy.jpg"),
  MovieModel(
      movieName: "Comedy", imageAsset: "assets/images/main/genres/comedy1.jpg"),
  MovieModel(
      movieName: "Drama",
      imageAsset:
          "assets/images/main/popular_movies/TheShawshankRedemption/TheShawshankRedemption(Cover).jpg"),
  MovieModel(
      movieName: "Action",
      imageAsset:
          "assets/images/main/popular_movies/TheDarkKnight/TheDarkKnight(Cover).jpg"),
];

final genresPage = [
  MovieModel(
      movieName: "Romance",
      imageAsset: "assets/images/main/genres/romance1.jpg"),
  MovieModel(
      movieName: "Sci-Fi",
      imageAsset:
          "assets/images/main/animations/StarWarsTheCloneWars/TheCloneWars(Cover).jpg"),
  MovieModel(
    movieName: "Series",
    imageAsset: "assets/images/main/genres/shows1.jpg",
  ),
];
