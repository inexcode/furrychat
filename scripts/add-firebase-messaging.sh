#!/usr/bin/env bash

flutter pub add fcm_shared_isolate:0.2.0
flutter pub get

if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' 's,//<GOOGLE_SERVICES>,,g' lib/utils/background_push.dart
  sed -i '' -e 's,^/\*,,' -e 's,\*/$,,' android/app/src/main/kotlin/dev/inex/furrychat/FcmPushService.kt
else
  sed -i 's,//<GOOGLE_SERVICES>,,g' lib/utils/background_push.dart
  sed -i -e 's,^/\*,,' -e 's,\*/$,,' android/app/src/main/kotlin/dev/inex/furrychat/FcmPushService.kt
fi
