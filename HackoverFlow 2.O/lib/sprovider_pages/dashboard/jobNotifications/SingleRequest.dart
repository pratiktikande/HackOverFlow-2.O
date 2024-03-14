import 'package:flutter/material.dart';

class NotificaionDetails extends StatelessWidget {
  final Map<String, dynamic> request;

  NotificaionDetails(this.request);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(request['title']),
      ),
      body: ListView(
        children: [
          Text(request['service_details']['description']),
          Text('Budget: ${request['budget_and_pricing']['budget']}'),
          Text('Timeline: ${request['timeline']['start_date']} - ${request['timeline']['deadline']}'),
          Text('Communication Preference: ${request['communication_preferences']['preferred_method']}'),
          Text('Service Provider: ${request['serv_prov']}'),
        ],
      ),
    );
  }
}
