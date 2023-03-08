import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform and File

import 'package:ffi/ffi.dart'; // For allocating memory
import 'package:win32/win32.dart';

final kernel32 = DynamicLibrary.open('kernel32.dll');

final GetConsoleWindow = kernel32
    .lookupFunction<IntPtr Function(), int Function()>('GetConsoleWindow');

const CTRL_CLOSE_EVENT = 0x0010;
final _handlerRoutine =
    Pointer.fromFunction<Uint32 Function(Uint32)>(consoleCtrlHandler, 0);

int consoleCtrlHandler(int event) {
  if (event == CTRL_CLOSE_EVENT) {
    // TODO: executePostProcessを呼び出す（see: https://github.com/dart-lang/sdk/issues/37022）
    File('Exit.txt').createSync();

    return 1;
  }
  return 0;
}

void main() {
  if (Platform.isWindows) {
    // Get the handle of the console window
    final consoleWindowHandle = GetConsoleWindow();
    print(consoleWindowHandle);

    // 終了処理を行うための Ctrl-C ハンドラーを登録する
    SetConsoleCtrlHandler(_handlerRoutine, 1);

    while (true) {
      sleep(const Duration(milliseconds: 10));
    }
  }
}
