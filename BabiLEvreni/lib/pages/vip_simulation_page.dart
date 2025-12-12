import 'package:flutter/material.dart';

class VipSimulationPage extends StatefulWidget {
  @override State<VipSimulationPage> createState() => _VipSimulationPageState();
}

class _VipSimulationPageState extends State<VipSimulationPage> {
  bool _running=false;
  String _out='';
  Future<void> _run() async {
    setState(()=>_running=true); await Future.delayed(Duration(seconds:2));
    setState(()=>_out='Simülasyon tamamlandı: örnek sonuçlar (VIP).'); setState(()=>_running=false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('VIP Simulation')), body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
      Text('VIP Canlı Simülasyon - 10.000 senaryo (simülasyon stub)'),
      SizedBox(height:12),
      ElevatedButton(child: Text('Başlat'), onPressed: _running?null:_run),
      SizedBox(height:12),
      Expanded(child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius: BorderRadius.circular(12)), child: SingleChildScrollView(child: Text(_out.isEmpty?'Simülasyon sonucu burada.':_out))))
    ],),),);
  }
}