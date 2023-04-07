///
///
///   1.添加依赖
///   dependencies:
///   freezed_annotation: ^2.2.0
///
///   dev_dependencies:
///   build_runner: ^2.3.3
///   freezed: ^2.3.2
///
/// test_state.dart
/// 2. 导包
import 'package:freezed_annotation/freezed_annotation.dart';

/// 3. 声明文件一般是本文件名加freezed
part 'test_state.freezed.dart';

/// 4. 添加注释
@freezed
/// 5.组合 `with _$ClassName`
abstract class TestState with _$TestState {
  /// 6.声明页面加载的各种状态
  const factory TestState.noError() = _NoError;
  const factory TestState.error(String errorText) = _Error;
  const factory TestState.loading() = _Loading;
}

///或者bean类

@freezed
class User with _$User {
  const factory User({
    required String name,
    required int age,
    String? email,
  }) = _User;
}

/// Terminal 执行 flutter pub run build_runner build --delete-conflicting-outputs
/// 然后就可以使用copyWith之类的方法了

///eg


  void main(){
    User user=const User(name: "zhangsan",age: 10);
    print(user.toString()); //User(name: zhangsan, age: 10, email: null)
    user=user.copyWith(age: 18);
    print(user.toString()); // User(name: zhangsan, age: 18, email: null)
  }
