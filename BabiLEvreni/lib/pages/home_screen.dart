import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/ai_service.dart';
import '../services/simulation_engine.dart';
import 'premium_page.dart';
import 'vip_simulation_page.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _ctrl = TextEditingController();
  String _out = '';
  bool _loading = false;

  Future<void> _analyze() async {
    setState(() { _loading = true; _out = ''; });
    final ai = AIService();
    final state = Provider.of<AppState>(context, listen:false);
    final res = await ai.predict(_ctrl.text, premium: state.isPremium);
    setState(() { _out = res; _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BabiLEvreni'),
        actions: [IconButton(icon: Icon(Icons.star, color: state.isPremium?Colors.amber:Colors.grey), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>PremiumPage())) )],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Text('Türkiye özel analizler', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height:12),
          TextField(controller: _ctrl, decoration: InputDecoration(hintText: 'Fenerbahçe - Galatasaray, son 5 maç...'), minLines:1, maxLines:3),
          SizedBox(height:8),
          Row(children: [Expanded(child: ElevatedButton.icon(icon: Icon(Icons.analytics), label: Text('Analiz'), onPressed: _loading?null:_analyze)), SizedBox(width:8), OutlinedButton(child: Text('Simulate VIP'), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>VipSimulationPage())) )]),
          SizedBox(height:12),
          Expanded(child: Container(width: double.infinity, padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius: BorderRadius.circular(12)), child: SingleChildScrollView(child: Text(_out.isEmpty? 'Analiz sonuçları burada.':_out)))),
        ]),
      ),
    );
  }
}