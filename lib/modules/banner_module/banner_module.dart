class AppBannerModule {
  final int id;
  final String title;
  final String thumbnaiUrl;
  AppBannerModule(this.id, this.thumbnaiUrl, this.title);
}

List<AppBannerModule> appBannerList = [
  AppBannerModule(1, 'Title',
      'https://hoangvietauto.vn/wp-content/uploads/E1BAA2nh-siC3AAu-xe-C491E1BAB9p-chE1BAA5t-lC6B0E1BBA3ng-cao.jpg'),
  AppBannerModule(1, 'Title',
      'https://hoangvietauto.vn/wp-content/uploads/HC3ACnh-siC3AAu-xe-Lamborghini-scaled.jpg'),
  AppBannerModule(1, 'Title',
      'https://thienthanhlimo.com/wp-content/uploads/2022/05/101-anh-sieu-xe-4k-tai-free-lam-hinh-nen-dt-may-tinh-52.jpg'),
  AppBannerModule(1, 'Title',
      'https://scr.vn/wp-content/uploads/2020/07/Supercar-4K-scaled.jpg'),
];
