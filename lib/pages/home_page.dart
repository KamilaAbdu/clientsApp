import 'package:flutter/material.dart';
import 'package:list_of_clients/clients/clients.dart';
import 'package:list_of_clients/clients/clients_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ClientsRepository repository = ClientsRepository();
  List<Client> displayedClients = [];
  Client? foundClient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Приложение учета клиентов'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Поиск клиента по имени'),
              onChanged: (text) {
                setState(() {
                  foundClient = repository.findClient(text);
                });
              },
            ),
            SizedBox(height: 20),
            foundClient != null
                ? Text(
                    'Клиент: ${foundClient!.firstName} ${foundClient!.lastName}')
                : Text('Клиент не найден'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  displayedClients = repository.getAllClients();
                });
              },
              child: Text('Все клиенты'),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: displayedClients.length,
              itemBuilder: (context, index) {
                final client = displayedClients[index];
                return ListTile(
                  title: Text('${client.firstName} ${client.lastName}'),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
