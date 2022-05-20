import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_test/src/models/movie_model.dart';

class MoviesProvider {
  String _apikey = '3d0833a1535dc8556fbd5cde1457673f';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularPage = 0;
  List<Movie> _populars = [];
  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;
  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  void disposeStreams() {
    _popularsStreamController.close();
  }

  Future<List<Movie>> _processAnswer(Uri url) async {
    final answer = await http.get(url);
    final decodedData = json.decode(answer.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getOnTheaters() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'languaje': _language,
    });
    return await _processAnswer(url);
  }

  Future<List<Movie>> getPopular() async {
    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'languaje': _language,
      'page': _popularPage.toString(),
    });
    final answer = await _processAnswer(url);
    _populars.addAll(answer);
    popularsSink(_populars);

    return answer;
  }
}//
