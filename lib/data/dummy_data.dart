import 'package:flutter/material.dart';

import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

final List<User> dummyUsers = [
  const User(
    id: 'user_1',
    name: '김민준',
    bio: 'Flutter 개발자입니다. 새로운 기술을 탐구하는 것을 좋아합니다.',
    avatarColor: Colors.blue,
  ),
  const User(
    id: 'user_2',
    name: '이서연',
    bio: 'UI/UX 디자이너이자 프론트엔드 개발자입니다.',
    avatarColor: Colors.pink,
  ),
  const User(
    id: 'user_3',
    name: '박지호',
    bio: '백엔드 개발자. Go와 Dart를 주로 사용합니다.',
    avatarColor: Colors.green,
  ),
  const User(
    id: 'user_4',
    name: '최수아',
    bio: '모바일 앱 개발자. Flutter로 크로스플랫폼 앱을 만듭니다.',
    avatarColor: Colors.orange,
  ),
  const User(
    id: 'user_5',
    name: '정도윤',
    bio: '풀스택 개발자. 웹과 앱 모두 개발합니다.',
    avatarColor: Colors.purple,
  ),
];

final List<Post> dummyPosts = [
  Post(
    id: 'post_1',
    authorId: 'user_1',
    title: 'Flutter Riverpod 최신 버전 활용법',
    content:
        'Riverpod의 코드 생성 기능을 활용하면 보일러플레이트 코드를 대폭 줄일 수 있습니다. '
        '@riverpod 어노테이션을 사용하면 Provider, NotifierProvider 등을 자동으로 생성해줍니다. '
        'build_runner를 통해 .g.dart 파일을 생성하고, riverpod_generator가 타입 안전한 provider를 만들어줍니다. '
        '이번 글에서는 실전 예제를 통해 riverpod_generator의 주요 사용법을 정리해보겠습니다.',
    createdAt: DateTime(2025, 5, 1, 9, 0),
    likedUserIds: ['user_2', 'user_3', 'user_4'],
  ),
  Post(
    id: 'post_2',
    authorId: 'user_2',
    title: 'Flutter에서 애니메이션 효과 쉽게 구현하기',
    content:
        'Flutter에서 애니메이션을 구현하는 방법은 다양합니다. '
        'AnimationController를 직접 사용하거나, AnimatedBuilder, TweenAnimationBuilder 등의 위젯을 활용할 수 있습니다. '
        '또한 Lottie 패키지를 사용하면 복잡한 After Effects 애니메이션도 쉽게 구현할 수 있습니다. '
        '이번 글에서는 가장 자주 사용하는 애니메이션 패턴들을 소개합니다.',
    createdAt: DateTime(2025, 5, 2, 14, 0),
    likedUserIds: ['user_1', 'user_5'],
  ),
  Post(
    id: 'post_3',
    authorId: 'user_3',
    title: 'Go 언어로 REST API 서버 구축하기',
    content:
        'Go 언어는 가볍고 빠른 REST API 서버를 구축하기에 최적의 언어입니다. '
        'Gin 프레임워크를 사용하면 더욱 쉽게 API 서버를 만들 수 있습니다. '
        '이번 글에서는 기본적인 CRUD API를 Go와 Gin으로 구현하는 방법을 알아보겠습니다. '
        '특히 미들웨어 설정과 에러 핸들링에 집중해서 실무에서 바로 쓸 수 있는 코드를 작성해보겠습니다.',
    createdAt: DateTime(2025, 5, 3, 10, 0),
    likedUserIds: ['user_1', 'user_2', 'user_4', 'user_5'],
  ),
  Post(
    id: 'post_4',
    authorId: 'user_4',
    title: 'Flutter go_router 완벽 가이드',
    content:
        'go_router는 Flutter의 선언형 라우팅 패키지입니다. '
        'Navigator 2.0을 기반으로 하며, URL 기반 딥링크와 웹 지원이 뛰어납니다. '
        '이 글에서는 go_router의 기본 사용법부터 중첩 라우팅, 리다이렉션, 쿼리 파라미터까지 다루어 보겠습니다. '
        'Riverpod과 함께 사용하면 더욱 강력한 라우팅 시스템을 구성할 수 있습니다.',
    createdAt: DateTime(2025, 5, 4, 9, 30),
    likedUserIds: ['user_1', 'user_3'],
  ),
  Post(
    id: 'post_5',
    authorId: 'user_5',
    title: '웹 개발과 앱 개발의 차이점',
    content:
        '웹 개발과 앱 개발은 비슷한 것 같지만 실제로는 많은 차이가 있습니다. '
        '웹은 브라우저 환경에서 동작하며 HTML, CSS, JavaScript를 사용하고, '
        '앱은 각 플랫폼의 특성에 맞는 언어와 프레임워크를 사용합니다. '
        'Flutter는 이 두 가지를 모두 지원하는 강력한 프레임워크로, 하나의 코드베이스로 모바일·웹·데스크톱 앱을 만들 수 있습니다.',
    createdAt: DateTime(2025, 5, 5, 16, 0),
    likedUserIds: ['user_2', 'user_4'],
  ),
  Post(
    id: 'post_6',
    authorId: 'user_1',
    title: 'Dart의 null 안전성 완벽 이해하기',
    content:
        'Dart 2.12부터 도입된 null 안전성은 null 관련 오류를 컴파일 타임에 방지해줍니다. '
        'nullable 타입은 ? 를 붙여 표현하고, late 키워드로 초기화를 나중에 할 수도 있습니다. '
        '또한 ?. 연산자로 null 체크를 간편하게 하고, ?? 로 기본값을 설정할 수 있습니다. '
        '이를 잘 활용하면 더 안전하고 견고한 코드를 작성할 수 있습니다.',
    createdAt: DateTime(2025, 5, 6, 11, 0),
    likedUserIds: ['user_3', 'user_5'],
  ),
  Post(
    id: 'post_7',
    authorId: 'user_2',
    title: '좋은 UI 디자인을 위한 7가지 원칙',
    content:
        '좋은 UI 디자인은 사용자 경험을 크게 향상시킵니다. '
        '첫째, 일관성을 유지하세요. 둘째, 사용자에게 즉각적인 피드백을 제공하세요. '
        '셋째, 단순함을 추구하세요. 넷째, 직관적인 인터페이스를 만드세요. '
        '다섯째, 접근성을 고려하세요. 여섯째, 에러를 방지하는 구조로 설계하세요. '
        '일곱째, 항상 사용자 중심으로 생각하세요.',
    createdAt: DateTime(2025, 5, 7, 13, 0),
    likedUserIds: ['user_1', 'user_3', 'user_4', 'user_5'],
  ),
  Post(
    id: 'post_8',
    authorId: 'user_3',
    title: 'Docker로 개발 환경 통일하기',
    content:
        'Docker를 사용하면 팀 전체가 동일한 개발 환경을 사용할 수 있습니다. '
        'docker-compose를 활용하면 여러 서비스를 한 번에 관리할 수 있어 더욱 편리합니다. '
        '이번 글에서는 Flutter 앱의 백엔드 서버를 Docker로 구성하는 방법을 소개합니다. '
        '또한 CI/CD 파이프라인에 Docker를 통합하는 방법도 다루겠습니다.',
    createdAt: DateTime(2025, 5, 8, 10, 0),
    likedUserIds: ['user_1'],
  ),
  Post(
    id: 'post_9',
    authorId: 'user_4',
    title: '플러터 상태관리 비교: Riverpod vs Bloc vs GetX',
    content:
        'Flutter에는 다양한 상태관리 라이브러리가 있습니다. '
        'Riverpod은 타입 안전성과 코드 생성을 통한 편의성이 장점이고, '
        'Bloc은 이벤트 기반 아키텍처로 복잡한 비즈니스 로직에 적합합니다. '
        'GetX는 단순하고 빠르게 시작할 수 있지만 규모가 커지면 관리가 어려울 수 있습니다. '
        '프로젝트 규모와 팀 상황에 맞는 선택이 중요합니다.',
    createdAt: DateTime(2025, 5, 9, 15, 0),
    likedUserIds: ['user_2', 'user_3', 'user_5'],
  ),
  Post(
    id: 'post_10',
    authorId: 'user_5',
    title: '클린 아키텍처 Flutter 프로젝트에 적용하기',
    content:
        '클린 아키텍처는 코드를 Data, Domain, Presentation 레이어로 분리합니다. '
        '이를 통해 테스트 가능하고 유지보수가 쉬운 코드를 작성할 수 있습니다. '
        'Flutter 프로젝트에 클린 아키텍처를 적용하면 처음에는 복잡해 보이지만 장기적으로 큰 이점이 있습니다. '
        'Riverpod과 함께 사용하면 의존성 주입도 깔끔하게 처리할 수 있습니다.',
    createdAt: DateTime(2025, 5, 10, 9, 0),
    likedUserIds: ['user_1', 'user_2', 'user_3', 'user_4'],
  ),
  Post(
    id: 'post_11',
    authorId: 'user_1',
    title: 'Flutter 성능 최적화 팁 모음',
    content:
        'Flutter 앱의 성능을 최적화하는 방법들을 소개합니다. '
        'const 생성자를 적극 활용하고, ListView.builder로 리스트를 구현하고, 이미지는 캐싱을 활용하세요. '
        '또한 불필요한 rebuild를 줄이기 위해 Riverpod의 select 기능을 활용하면 특정 값만 구독할 수 있습니다. '
        'DevTools의 성능 탭을 통해 jank를 찾아내고 최적화하는 방법도 알아보겠습니다.',
    createdAt: DateTime(2025, 5, 11, 8, 0),
    likedUserIds: ['user_3', 'user_4'],
  ),
  Post(
    id: 'post_12',
    authorId: 'user_3',
    title: 'Firebase와 Flutter 연동 완벽 가이드',
    content:
        'Firebase는 Google이 제공하는 백엔드 서비스로, Flutter와 궁합이 매우 좋습니다. '
        'Authentication, Firestore, Storage, Cloud Functions 등 다양한 서비스를 쉽게 연동할 수 있습니다. '
        'FlutterFire CLI를 사용하면 더욱 간편하게 설정할 수 있습니다. '
        'Firestore의 실시간 스트림을 Riverpod StreamProvider와 결합하면 실시간 동기화 앱을 쉽게 만들 수 있습니다.',
    createdAt: DateTime(2025, 5, 11, 14, 0),
    likedUserIds: ['user_2', 'user_5'],
  ),
];

final List<Comment> dummyComments = [
  Comment(
    id: 'comment_1',
    postId: 'post_1',
    authorId: 'user_2',
    content: '정말 기대되는 업데이트네요! 코드 생성이 간편해진다니 좋겠습니다.',
    createdAt: DateTime(2025, 5, 1, 10, 30),
  ),
  Comment(
    id: 'comment_2',
    postId: 'post_1',
    authorId: 'user_3',
    content: '저도 riverpod_generator 써봤는데 확실히 편하더라고요.',
    createdAt: DateTime(2025, 5, 1, 11, 0),
  ),
  Comment(
    id: 'comment_3',
    postId: 'post_2',
    authorId: 'user_4',
    content: 'Lottie 패키지 정말 유용하죠! 저도 자주 씁니다.',
    createdAt: DateTime(2025, 5, 2, 15, 0),
  ),
  Comment(
    id: 'comment_4',
    postId: 'post_3',
    authorId: 'user_1',
    content: 'Go의 성능은 정말 놀랍죠. 특히 동시성 처리가 뛰어납니다.',
    createdAt: DateTime(2025, 5, 3, 11, 0),
  ),
  Comment(
    id: 'comment_5',
    postId: 'post_3',
    authorId: 'user_5',
    content: 'Gin 말고 Echo 프레임워크도 추천드립니다!',
    createdAt: DateTime(2025, 5, 3, 12, 0),
  ),
  Comment(
    id: 'comment_6',
    postId: 'post_3',
    authorId: 'user_2',
    content: '잘 읽었습니다. 다음 편도 기대됩니다!',
    createdAt: DateTime(2025, 5, 3, 13, 0),
  ),
  Comment(
    id: 'comment_7',
    postId: 'post_5',
    authorId: 'user_1',
    content: 'Flutter로 웹과 앱을 동시에 개발할 수 있어서 정말 편리합니다.',
    createdAt: DateTime(2025, 5, 5, 17, 0),
  ),
  Comment(
    id: 'comment_8',
    postId: 'post_6',
    authorId: 'user_4',
    content: 'null 안전성 덕분에 런타임 에러가 많이 줄었어요!',
    createdAt: DateTime(2025, 5, 6, 12, 0),
  ),
  Comment(
    id: 'comment_9',
    postId: 'post_7',
    authorId: 'user_3',
    content: '접근성 부분이 특히 중요한 것 같아요. 자주 놓치는 부분이죠.',
    createdAt: DateTime(2025, 5, 7, 14, 0),
  ),
  Comment(
    id: 'comment_10',
    postId: 'post_7',
    authorId: 'user_5',
    content: '디자인 시스템을 구축하면 일관성 유지가 훨씬 쉬워집니다!',
    createdAt: DateTime(2025, 5, 7, 15, 0),
  ),
  Comment(
    id: 'comment_11',
    postId: 'post_9',
    authorId: 'user_1',
    content: '저는 Riverpod을 가장 선호합니다. 타입 안전성이 정말 마음에 들어요.',
    createdAt: DateTime(2025, 5, 9, 16, 0),
  ),
  Comment(
    id: 'comment_12',
    postId: 'post_10',
    authorId: 'user_2',
    content: '클린 아키텍처에 Riverpod을 조합하면 정말 강력한 구조가 됩니다.',
    createdAt: DateTime(2025, 5, 10, 10, 0),
  ),
  Comment(
    id: 'comment_13',
    postId: 'post_10',
    authorId: 'user_4',
    content: '작은 프로젝트에서는 오버엔지니어링이 될 수 있어서 잘 판단해야 할 것 같아요.',
    createdAt: DateTime(2025, 5, 10, 11, 0),
  ),
  Comment(
    id: 'comment_14',
    postId: 'post_12',
    authorId: 'user_1',
    content: 'Firestore 실시간 업데이트 기능이 정말 강력하죠!',
    createdAt: DateTime(2025, 5, 11, 15, 0),
  ),
];
