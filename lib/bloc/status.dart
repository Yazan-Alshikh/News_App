abstract class NewsStatu {}

class NewsInitialStatu extends NewsStatu {}

class NewsChangeNavBarStatu extends NewsStatu {}

class NewsBusinessSeccssesStatu extends NewsStatu {}

class NewsBusinessErrorStatu extends NewsStatu {
  final String error;
  NewsBusinessErrorStatu (this.error);
}

class NewsBusinessLoadingStatu extends NewsStatu {}

class NewsSportSeccssesStatu extends NewsStatu {}

class NewsSportErrorStatu extends NewsStatu {
  final String error;

  NewsSportErrorStatu(this.error);
}

class NewsSportLoadingStatu extends NewsStatu {}

class NewsScienceSeccssesStatu extends NewsStatu {}

class NewsScienceErrorStatu extends NewsStatu {
  final String error;
  NewsScienceErrorStatu (this.error);
}

class NewsSearchLoadingStatu extends NewsStatu {}

class NewsSerachSeccssesStatu extends NewsStatu {}

class NewsSearchErrorStatu extends NewsStatu {
  final String error;
  NewsSearchErrorStatu (this.error);
}

class NewsScienceLoadingStatu extends NewsStatu {}

