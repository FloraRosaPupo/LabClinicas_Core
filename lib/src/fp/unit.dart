//Representação de uma ausencia de valor -> Nao retornar nada

final class Unit {
  @override
  String toString() {
    return 'Unit{}';
  }
}

Unit get unit => Unit();
