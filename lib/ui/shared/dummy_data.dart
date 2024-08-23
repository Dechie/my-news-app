import '../../core/models/article.dart';
import '../../core/models/news_agency.dart';

// since we don't use any actual api requests,
// we will instead feed the ui with these dummy data values.
// we will still mock the api requests though.

List<Article> articles = [
  Article(
    id: 0,
    title: "Global Summit on Climate Change: Historic Agreement Reached",
    image: "img1.jpg",
    category: "Environment",
    date: "Jun 9, 2023",
    publisherAgency: newsAgencies[0],
  ),
  Article(
    id: 1,
    title: "Tech Giant Unveils Revolutionary AI-powered Device",
    image: "img3.jpg",
    category: "Technology",
    date: "Jun 9, 2023",
    publisherAgency: newsAgencies[1],
  ),
];
List<NewsAgency> newsAgencies = [
  NewsAgency(
    id: 0,
    sourceTitle: "BBC NEWS",
    logo: "bbc-logo.png",
    totalNews: 133,
    followers: 1233,
    following: 4,
  ),
  NewsAgency(
    id: 1,
    sourceTitle: "The NYT",
    logo: "nyt-logo.png",
    totalNews: 123,
    followers: 4314,
    following: 6,
  ),
  NewsAgency(
    id: 2,
    sourceTitle: "Forbes",
    logo: "forbes-logo.png",
    totalNews: 43143,
    followers: 1341,
    following: 14314,
  ),
];
List<Article> recommendedArticles = [
  Article(
    id: 2,
    title: "Tech Startup Secures \$50 Million Funding for Expansion",
    image: "recommended_img1.jpg",
    category: "Business",
    date: "Jun 11, 2023",
    publisherAgency: newsAgencies[2],
  ),
  Article(
    id: 3,
    title: "Star Athlete Breaks World Record in Olympic Event",
    date: "Jun 10, 2023",
    category: "Business",
    image: "recommended_img1.jpg",
    publisherAgency: newsAgencies[2],
  ),
];
