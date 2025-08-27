import 'package:flutter/material.dart';

// --- 1. Breakpoint Enum ---
// Defines the different screen size breakpoints.
enum Breakpoint {
  xs, // Extra Small (e.g., phones in portrait)
  sm, // Small (e.g., phones in landscape, small tablets)
  md, // Medium (e.g., tablets in landscape, small laptops)
  lg, // Large (e.g., standard laptops, desktops)
  xl, // Extra Large (e.g., large monitors)
}

// --- 2. FlutGridItem Widget ---
// Represents an item within the responsive grid.
// It defines how many columns it should span at each breakpoint.
class FlutGridItem extends StatelessWidget {
  final Widget child;
  final int? xs; // Columns to span on extra small screens (default 12)
  final int? sm; // Columns to span on small screens
  final int? md; // Columns to span on medium screens
  final int? lg; // Columns to span on large screens
  final int? xl; // Columns to span on extra large screens

  // The total number of columns in the grid system.
  static const int totalColumns = 12;

  const FlutGridItem({
    super.key,
    required this.child,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  // Helper method to get the column span for the current breakpoint.
  int getSpanForBreakpoint(Breakpoint breakpoint) {
    switch (breakpoint) {
      case Breakpoint.xs:
        return xs ?? totalColumns; // Default to full width on xs if not specified
      case Breakpoint.sm:
        return sm ?? xs ?? totalColumns; // Fallback to xs, then full width
      case Breakpoint.md:
        return md ?? sm ?? xs ?? totalColumns; // Fallback chain
      case Breakpoint.lg:
        return lg ?? md ?? sm ?? xs ?? totalColumns; // Fallback chain
      case Breakpoint.xl:
        return xl ?? lg ?? md ?? sm ?? xs ?? totalColumns; // Fallback chain
    }
  }

  @override
  Widget build(BuildContext context) {
    // This widget will now be sized by its parent (FlutGrid) using SizedBox.
    // The width calculation logic moves to the parent.
    return child;
  }
}

// --- 3. ResponsiveGrid Widget ---
// The main grid container that arranges FlutGridItem children.
class FlutGrid extends StatelessWidget {
  final List<FlutGridItem> children;
  final double spacing; // Horizontal spacing between items.
  final double runSpacing; // Vertical spacing between lines of items.

  const FlutGrid({
    super.key,
    required this.children,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
  });

  // Helper to determine the current breakpoint based on width.
  Breakpoint _getCurrentBreakpoint(double width) {
    if (width >= 1920) {
      return Breakpoint.xl;
    } else if (width >= 1280) {
      return Breakpoint.lg;
    } else if (width >= 960) {
      return Breakpoint.md;
    } else if (width >= 600) {
      return Breakpoint.sm;
    } else {
      return Breakpoint.xs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final Breakpoint currentBreakpoint = _getCurrentBreakpoint(maxWidth);

        List<Widget> rows = [];
        List<FlutGridItem> currentRowItems = [];
        int currentRowSpan = 0;

        for (int i = 0; i < children.length; i++) {
          final FlutGridItem item = children[i];
          final int itemSpan = item.getSpanForBreakpoint(currentBreakpoint);

          // If adding this item exceeds 12 columns, start a new row.
          // Or if the item itself demands 12 columns, it should be on its own row.
          if (currentRowSpan + itemSpan > FlutGridItem.totalColumns || itemSpan == FlutGridItem.totalColumns) {
            if (currentRowItems.isNotEmpty) {
              rows.add(_buildRow(currentRowItems, maxWidth));
              rows.add(SizedBox(height: runSpacing)); // Add vertical spacing between rows
            }
            currentRowItems = [];
            currentRowSpan = 0;
          }

          currentRowItems.add(item);
          currentRowSpan += itemSpan;
        }

        // Add the last row if it has items
        if (currentRowItems.isNotEmpty) {
          rows.add(_buildRow(currentRowItems, maxWidth));
        }

        return Column(
          children: rows,
        );
      },
    );
  }

  // Helper to build a single row of grid items.
  Widget _buildRow(List<FlutGridItem> items, double parentWidth) {
    if (items.isEmpty) return const SizedBox.shrink();

    List<Widget> rowChildren = [];
    int totalSpanInRow = 0;
    for (var item in items) {
      totalSpanInRow += item.getSpanForBreakpoint(_getCurrentBreakpoint(parentWidth));
    }

    // Calculate the total width taken by spacing in this row.
    // There are (number of items - 1) * spacing gaps.
    final double totalSpacingWidth = (items.length > 1 ? (items.length - 1) * spacing : 0.0);

    // Calculate the available width for content (excluding spacing).
    // Ensure this is not negative.
    final double availableContentWidth = (parentWidth - totalSpacingWidth).clamp(0.0, double.infinity);

    // Calculate the width of one "column unit" for this row.
    // This is the available content width divided by the sum of spans in this row.
    // This ensures items scale correctly even if totalSpanInRow is less than 12.
    // Avoid division by zero if totalSpanInRow is 0.
    final double columnUnitWidth = totalSpanInRow > 0 ? availableContentWidth / totalSpanInRow : 0.0;


    for (int i = 0; i < items.length; i++) {
      final FlutGridItem item = items[i];
      final int itemSpan = item.getSpanForBreakpoint(_getCurrentBreakpoint(parentWidth));
      final double itemWidth = itemSpan * columnUnitWidth;

      rowChildren.add(
        SizedBox(
          width: itemWidth,
          child: item.child, // Directly use the child from FlutGridItem
        ),
      );

      if (i < items.length - 1) {
        rowChildren.add(SizedBox(width: spacing)); // Add horizontal spacing
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top of the row
      children: rowChildren,
    );
  }
}