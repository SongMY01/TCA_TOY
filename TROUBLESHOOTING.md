# 트러블슈팅 기록

## 1. `External macro implementation type 'ComposableArchitectureMacros.ReducerMacro' could not be found for macro 'Reducer()'`

- **날짜:** 2026-10-21
- **환경:** Xcode 27.0, swift-composable-architecture 1.26.2 (SPM)
- **증상:** `@Reducer` 사용 시 `No such file or directory`와 함께 매크로 구현 타입을 찾을 수 없다는 오류가 발생한다.
- **원인:** 컴파일된 `ComposableArchitectureMacros` 바이너리가 없다. 빌드가 중단되었거나 DerivedData 캐시가 오래된 경우에 생긴다.

### 해결 방법

1. 이 프로젝트의 DerivedData를 삭제한다.
   ```bash
   rm -rf ~/Library/Developer/Xcode/DerivedData/TCA_TOY-*
   ```
2. 매크로 검증을 건너뛰고 빌드해서 매크로를 컴파일한다.
   ```bash
   xcodebuild -project TCA_TOY.xcodeproj -scheme TCA_TOY \
     -destination 'generic/platform=iOS Simulator' \
     -skipMacroValidation -skipPackagePluginValidation build
   ```
3. Xcode를 종료했다가 다시 열고 Cmd+B로 빌드한다.
4. 매크로 프롬프트가 뜨면 **Trust & Enable**을 누른다. 프롬프트가 안 뜨면 Report/Issues navigator의 매크로 오류에서 누른다.

### 그래도 안 될 때

- File → Packages → Reset Package Caches
- Product → Clean Build Folder (Cmd+Shift+K)
- File → Packages → Resolve Package Versions

### 참고

- 매크로(SPM 플러그인)는 보안상 처음 사용할 때 사용자의 신뢰(Trust & Enable)가 필요하다.
- 명령줄에서는 `-skipMacroValidation` 옵션으로 이 확인을 건너뛴다.
