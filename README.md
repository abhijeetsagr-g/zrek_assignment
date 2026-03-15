# Instagram Feed UI — Flutter Assignment

A replication of the Instagram Home Feed built with Flutter, 
submitted as part of the ZREX Flutter Developer Internship Assignment.

## Features
- Instagram-style Home Feed with Stories tray and Post feed
- Shimmer loading states for both stories and posts
- Infinite scroll pagination with lazy loading
- Carousel posts with synchronized dot indicator and swipe counter
- Pinch-to-Zoom image overlay with snap-back animation
- Double tap to like with heart animation overlay
- Like and Save stateful toggles
- Custom Snackbar for unimplemented actions
- Error state handling with broken image fallback

## State Management — BLoC

BLoC (Business Logic Component) was chosen for the following reasons:

- **Separation of concerns** — UI, business logic, and data are strictly separated
- **Predictable state** — every UI change is driven by an explicit event and state
- **Scalability** — adding new features (e.g. comments, reels) only requires new events/states
- **Testability** — BLoC logic can be unit tested independently of the UI

The feed is managed by a single `FeedBloc` with the following events:
- `FeedStarted` — initial load
- `FeedLoadMore` — pagination trigger
- `FeedLikeToggled` — like/unlike a post
- `FeedSaveToggled` — save/unsave a post

## Architecture
```
lib/
├── core/
│   ├── config/        # AppTheme
│   └── const/         # AppIcons
├── logic/
│   ├── bloc/          # FeedBloc, FeedEvent, FeedState
│   ├── model/         # Post
│   └── repository/    # PostRepository
├── ui/
│   ├── screen/        # FeedScreen
│   ├── view/          # FeedScrollView
│   └── widget/        # All UI widgets
└── main.dart
```

## Packages Used

| Package | Purpose |
|---|---|
| `flutter_bloc` | State management |
| `cached_network_image` | Network image caching |
| `shimmer` | Shimmer loading effects |
| `like_button` | Like animation |
| `pinch_scrollable` | Pinch-to-zoom in scroll views |
| `flutter_svg` | SVG icon rendering |

## Run Instructions

1. Clone the repository
```bash
   git clone https://github.com/YOUR_USERNAME/zrek_assignment.git
   cd zrek_assignment
```

2. Install dependencies
```bash
   flutter pub get
```

3. Run the app
```bash
   flutter run
```

## Demo
### Shimmer Loading
![Shimmer](demo/shimmer.gif)

### Stories Tray
![Stories](demo/stories.gif)

### Infinite Scroll
![Scroll](demo/scroll.gif)

### Pinch to Zoom
![Zoom](demo/zoom.gif)

### Like & Save Toggle
![Toggle](demo/toggle.gif)

### Unimplemented Actions
![Unimplemented](demo/unimplemented.gif)

## Screenshots
![Shimmer](demo/shimmer.png)

![Loaded](demo/loaded.png)