import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AURUM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WithdrawScreen(),
    );
  }
}

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  int _selectedAccount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: BoxDecoration(
              color: Color(0xFFF0F4F8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF0A2A4A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const Text(
                  'Retirar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          // Amount and balance
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  '620.00',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A2A4A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tu saldo en soles S/. 8.500.000',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Account selection
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Elegir cuenta bancaria',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ..._buildBankAccounts(),
                ],
              ),
            ),
          ),
          // Continue button
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: ElevatedButton(
              onPressed: () {
                // Handle continue press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0A2A4A),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'CONTINUAR',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBankAccounts() {
    List<Map<String, dynamic>> bankAccounts = [
      {
        'name': 'Cuenta Personal',
        'number': '****_ **** - 9876',
        'icon': Icons.person,
      },
      {
        'name': 'Cuenta en Soles',
        'number': '****_ **** - 9714',
        'icon': Icons.account_balance_wallet,
      },
      {
        'name': 'Cuenta Familiar',
        'number': '****_ **** - 7941',
        'icon': Icons.home,
      },
    ];

    return bankAccounts.asMap().entries.map((entry) {
      int index = entry.key;
      Map<String, dynamic> account = entry.value;
      bool isSelected = _selectedAccount == index;

      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedAccount = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? Color(0xFF0A2A4A) : Colors.transparent,
              width: isSelected ? 2 : 0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Account icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF0A2A4A),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  account['icon'],
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 15),
              // Account info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2A4A),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      account['number'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Selection indicator
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Color(0xFF0A2A4A) : Colors.grey,
                    width: 2,
                  ),
                  color: isSelected ? Color(0xFF0A2A4A) : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
