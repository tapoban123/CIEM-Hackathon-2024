enum Pages {
  homePage(pageNumber: 0),
  communityPage(pageNumber: 1),
  notificationsPage(pageNumber: 2),
  coursesPage(pageNumber: 3),
  ebooksPage(pageNumber: 4);

  final int pageNumber;

  const Pages({required this.pageNumber});
}

class PageNumber {
  static int homePage = 0;
  static int communityPage = 1;
  static int notificationsPage = 2;
  static int coursesPage = 3;
  static int ebooksPage = 4;
}
