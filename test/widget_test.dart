import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:deliver_ease/main.dart';
import 'package:deliver_ease/Services/api_service.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Config/config.dart';

// Mocking the HTTP client
class MockClient extends Mock implements http.Client {}

void main() {
  testWidgets('Test login method generates error', (WidgetTester tester) async {
    // Create a mock HTTP client
    MockClient mockClient = MockClient();

    // Create an instance of APIService with the mock client
    APIService.client = mockClient;

    // Define the behavior of the client.post method in the mock object

    // Build the widget
    await tester.pumpWidget(MyApp());

    // Create a login request model
    LoginRequestModel loginModel = LoginRequestModel(email: "sender@gmail.com", password: "1234");

    // Call the login method and store the result
    bool loginResult = await APIService.login(loginModel);

    // Verify that the login method is called once with the specified parameters
    verify(mockClient.post(
      Uri.parse(APIConfig.API_URL + APIConfig.LOGIN_URL),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginModel.toJson()),
    )).called(1);

    // Verify that the login result is true
    expect(loginResult, true);
  });
}
