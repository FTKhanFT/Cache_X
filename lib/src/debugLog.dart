part of cache_x;

class DebugLog {
  static print(
    Object? object, {
    bool bold = true,
    Color foreground = Colors.yellowAccent,
    Color? background,
    bool italic = false,
    bool underline = false,
    String prefix = "Cache_X",
  }) {
    printColor(
      object,
      PrintColorStyle(
        bold: bold,
        background: background,
        prefix: prefix,
        foreground: foreground,
        italic: italic,
        underline: underline,
      ),
    );
  }
}
