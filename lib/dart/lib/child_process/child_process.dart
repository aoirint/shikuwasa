import 'dart:async';
import 'dart:convert';
import 'dart:io';

var _initialized = false;
final childProcesses = <Process>[];

StreamSubscription<ProcessSignal>? sigintSubscription;
StreamSubscription<ProcessSignal>? sigtermSubscription;
StreamSubscription<ProcessSignal>? sigkillSubscription;

void _onProcessSignal(ProcessSignal signal) {
  for (final childProcess in childProcesses) {
    childProcess.kill(signal);
  }
}

/// Workaround for [dart-lang/sdk#49234](https://github.com/dart-lang/sdk/issues/49234)
void _initializeOnce() {
  if (_initialized) return;

  ProcessSignal.sigint.watch().listen(_onProcessSignal);

  if (!Platform.isWindows) {
    ProcessSignal.sigterm.watch().listen(_onProcessSignal);
    ProcessSignal.sigkill.watch().listen(_onProcessSignal);
  }

  _initialized = true;
}

Future<void> finalizeChildProcesses() async {
  await sigintSubscription?.cancel();
  await sigtermSubscription?.cancel();
  await sigkillSubscription?.cancel();
}

Future<Process> startChildProcess(
  String executable,
  List<String> arguments, {
  String? workingDirectory,
  Map<String, String>? environment,
  bool includeParentEnvironment = true,
  bool runInShell = false,
  ProcessStartMode mode = ProcessStartMode.normal,
}) async {
  _initializeOnce();

  return Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    environment: environment,
    includeParentEnvironment: includeParentEnvironment,
    runInShell: runInShell,
    mode: mode,
  );
}

Future<ProcessResult> runChildProcess(
  String executable,
  List<String> arguments, {
  String? workingDirectory,
  Map<String, String>? environment,
  bool includeParentEnvironment = true,
  bool runInShell = false,
  Encoding? stdoutEncoding = systemEncoding,
  Encoding? stderrEncoding = systemEncoding,
}) async {
  _initializeOnce();

  return Process.run(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    environment: environment,
    includeParentEnvironment: includeParentEnvironment,
    runInShell: runInShell,
    stdoutEncoding: stdoutEncoding,
    stderrEncoding: stderrEncoding,
  );
}
