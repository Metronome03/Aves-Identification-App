import 'package:wikidart/wikidart.dart';

class WikiSearch {
  Future<dynamic> wikiSearch(String name) async
  {
    var res = await Wikidart.searchQuery(name);
    var pageid = res?.results?.first.pageId;


    var google = (await Wikidart.summary(pageid!));
    var extract=google?.extract;
    return extract;
  }
}