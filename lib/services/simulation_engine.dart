class SimulationEngine {
  // Simulate N scenarios and return aggregated result (stub)
  Future<String> runSimulation(String match, int runs) async {
    await Future.delayed(Duration(milliseconds: 500));
    return 'Simulated $runs runs for $match. (stub results)';
  }
}