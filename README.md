# Skeletons

A Flutter package for building custom skeleton widgets to mimic the page's layout while loading.

## Examples


| Items | |
| ------------- | ------------- |
| ![items](gifs/items.gif)  | ![paragraphs](gifs/paragraph.gif)  |

| ListView (Default)  | ListView (Custom) |
| ------------- | ------------- |
| ![listview_default](gifs/listview_default.gif)  | ![listview_custom](gifs/listview_custom.gif)  |

| SkeletonTheme  | Light/Dark modes |
| ------------- | ------------- |
| ![skeleton_theme](gifs/skeleton_theme.gif)  | ![light_dark_modes](gifs/light_dark_modes.gif)  |

| Right-To-Left  | Custom Shimmer |
| ------------- | ------------- |
| ![rtl](gifs/rtl.gif)  | ![custom_shimmer](gifs/custom_shimmer.gif)  |


All examples can be found here [examples](https://github.com/badjio/skeletons/tree/master/example/lib/examples).

## How To Use

Can be used by encapsulating the child widget in a Skeleton widget:

```dart
import 'package:skeletons/skeletons.dart';

Skeleton(
        isLoading: _isLoading,
        skeleton: SkeletonListView(),
        child: Container(child: Center(child: Text("Content"))),
      )
 ```

 or directly:

 ```dart
 Container(
     child: _isLoading 
     ? SkeletonListView() 
     : Container(child: Center(
                        child: Text("Content"))),
 )

 ```

a SkeletonTheme can be used to set the default configs for all skeleton descendants in the tree.

```dart
SkeletonTheme(
    // themeMode: ThemeMode.light,
    shimmerGradient: LinearGradient(
        colors: [
          Color(0xFFD8E3E7),
          Color(0xFFC8D5DA),
          Color(0xFFD8E3E7),
        ],
        stops: [
          0.1,
          0.5,
          0.9,
        ],
      ),
      darkShimmerGradient: LinearGradient(
        colors: [
          Color(0xFF222222),
          Color(0xFF242424),
          Color(0xFF2B2B2B),
          Color(0xFF242424),
          Color(0xFF222222),
        ],
        stops: [
          0.0,
          0.2,
          0.5,
          0.8,
          1,
        ],
        begin: Alignment(-2.4, -0.2),
        end: Alignment(2.4, 0.2),
        tileMode: TileMode.clamp,
      ),
        child: MateriaApp(
            ...
        ),
      ),
```

## Issues and feedback

For issues, please report [here](https://github.com/badjio/skeletons/issues). Contributions are welcome.


