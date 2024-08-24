part of 'dummy_data.dart';

/// the relationship between the news articles and
/// the news agencies creates a circular dependencies
/// so we have to create them statically first (by making)
/// their arguments nullable, then assign those arguments
/// later on
///

/// news agencies
var bbc = NewsAgency(
  id: 0,
  articlesPublished: [], // Empty at initialization
  sourceTitle: "BBC NEWS",
  sourceUsername: "bbcnews",
  logo: "bbc-logo.png",
  description:
      "Empowering your business journey with expert insights and influential perspectives.",
  totalNews: 133,
  followers: 1233,
  following: 4,
);
var espn = NewsAgency(
  id: 2,
  sourceTitle: "Forbes",
  sourceUsername: "forbesnews",
  description:
      "Empowering your business journey with expert insights and influential perspectives.",
  logo: "forbes-logo.png",
  totalNews: 43143,
  followers: 1341,
  following: 14314,
);
var forbes = NewsAgency(
  id: 2,
  sourceTitle: "Forbes",
  sourceUsername: "forbesnews",
  description:
      "Empowering your business journey with expert insights and influential perspectives.",
  logo: "forbes-logo.png",
  totalNews: 43143,
  followers: 1341,
  following: 14314,
);
var nyt = NewsAgency(
  id: 1,
  sourceTitle: "The NYT",
  sourceUsername: "thenyt",
  description:
      "Empowering your business journey with expert insights and influential perspectives.",
  logo: "nyt-logo.png",
  totalNews: 123,
  followers: 4314,
  following: 6,
);

////////
///recommended articles
var recom1 = Article(
  id: 2,
  title: "Tech Startup Secures \$50 Million Funding for Expansion",
  image: "recommended_img1.jpg",
  category: "Business",
  date: "Jun 11, 2023",
);
var recom2 = Article(
  id: 3,
  title: "Star Athlete Breaks World Record in Olympic Event",
  date: "Jun 10, 2023",
  category: "Sports",
  image: "recommended_img2.jpg",
);

/// trending articles
var tr1 = Article(
  id: 0,
  title: "Global Summit on Climate Change: Historic Agreement Reached",
  image: "trending_img1.jpg",
  category: "Environment",
  date: "Jun 9, 2023",
);
var tr2 = Article(
  id: 1,
  title: "Tech Giant Unveils Revolutionary AI-powered Device",
  image: "trending_img2.jpg",
  category: "Technology",
  date: "Jun 9, 2023",
);
