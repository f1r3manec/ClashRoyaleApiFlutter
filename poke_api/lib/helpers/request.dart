import '../Models/cards_models.dart';
import "package:http/http.dart" as http;

const String apiKey =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjI5ZmNkZDcwLWVmYmUtNGNmZS1iNTQ1LWJkMjhiZmIwODUwNiIsImlhdCI6MTY3MzgxOTQxNywic3ViIjoiZGV2ZWxvcGVyLzMzNjMxYzQ1LTdjMzEtNjg5Yy05ZGI5LTBjNzYxZDI3N2ZkZSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxODEuMzkuMjA4LjEzMiJdLCJ0eXBlIjoiY2xpZW50In1dfQ.5FnF4xoltvpRyDLekx7l8-DhQGFepYZ8E6ez-PVY-uYwvF7P76CT3hQVQN8GVxtgg1fhnjDmbbroQx_vaLELAA";
const String url = 'https://api.clashroyale.com/';

const headersRequest = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $apiKey'
};
Future<CardsList?> getCards() async {
  const endPoint = "v1/cards";
  final response =
      await http.get(Uri.parse('$url$endPoint'), headers: headersRequest);
  return cardsListFromJson(response.body);
}
