import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Premium')),
      body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        Text('VIP Paketler', style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height:12),
        Text('Premium ile GPT-4.1 modeline erişim, hızlandırılmış sunucu ve bulut arşivi.'),
        SizedBox(height:12),
        ElevatedButton(child: Text(state.isPremium?'Zaten Premium':'Premium Ol (Demo)'), onPressed: (){ state.setPremium(true); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Premium demo etkin.'))); }),
        SizedBox(height:12),
        Text('Türkiye özel entegrasyonlar: canlı lig filtreleri, yerel API adaptörleri (placeholder).')
      ],),),
    );
  }
);