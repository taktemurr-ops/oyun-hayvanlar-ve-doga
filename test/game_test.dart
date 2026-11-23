import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hayvanlar_ve_doga/oyun_hayvanlar_ve_doga.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hayvanlarDogaConfig.title.length, 33);
    expect(hayvanlarDogaConfig.tagline.length, 33);
    for (final s in hayvanlarDogaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hayvanlarDogaConfig.gameId, hayvanlarDogaId);
    expect(hayvanlarDogaRules.gameId, hayvanlarDogaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hayvanlarDogaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hayvanlarDogaId, optionalMechanics: hayvanlarDogaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hayvanlarDogaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
