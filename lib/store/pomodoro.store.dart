import 'dart:async';

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
  TipoIntervalo tipoIntervalo = TipoIntervalo.trabalho;

  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reinicar() {
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
    if (estaTrabalhando()) {
      reinicar();
    }
  }

  @action
  void decrementarTempoTrabalho() {
    if (tempoTrabalho > 1) {
      tempoTrabalho--;
      if (estaTrabalhando()) {
        reinicar();
      }
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reinicar();
    }
  }

  @action
  void decrementarTempoDescanso() {
    if (tempoDescanso > 1) {
      tempoDescanso--;

      if (estaDescansando()) {
        reinicar();
      }
    }
  }

  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.trabalho;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.descanso;
  }

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.descanso;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.trabalho;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}
