import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { trabalho, descanso }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 0;

  @observable
  int tempoDescanso = 0;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.descanso;

  @action
  void iniciar() {
    iniciado = true;
  }

  @action
  void parar() {
    iniciado = false;
  }

  @action
  void reinicar() {
    minutos = 0;
    segundos = 0;
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho() {
    if (tempoTrabalho < 1) {
      tempoTrabalho = 0;
    } else {
      tempoTrabalho--;
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso() {
    if (tempoDescanso < 1) {
      tempoDescanso = 0;
    } else {
      tempoDescanso--;
    }
  }

  bool estaTrabalhando() {
    return tempoTrabalho == TipoIntervalo.trabalho;
  }

  bool estaDescansando() {
    return tempoTrabalho == TipoIntervalo.descanso;
  }
}
