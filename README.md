# go_bang

五子棋

## flutter inject config

config.json

```json
{
  "base_url": "https://www.baidu.com",
  "log_prex": "yk"
}
```

---
flutter 注入

```shell
flutter run --dart-define-from-file=config.json
```

flutter 获取

```dart
String.fromEnvironment("base_url");
```

---
gradle 注入

```gradle
def dartEnvVar = [
  base_url:project.hasProperty("base_url")?base_url:"error url"
]

print("=================${dartEnvVar}==================")
```
