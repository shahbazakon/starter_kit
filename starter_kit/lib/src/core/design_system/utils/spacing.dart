import 'package:flutter/material.dart';

/// Spacing utilities for the application
class AppSpacing {
  AppSpacing._();

  // Standard spacing values
  static const double none = 0.0;
  static const double xxxs = 2.0;
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;
  static const double xxxl = 48.0;
  static const double huge = 64.0;

  // Horizontal spacing widgets
  static const Widget horizontalNone = SizedBox(width: none);
  static const Widget horizontalXXXS = SizedBox(width: xxxs);
  static const Widget horizontalXXS = SizedBox(width: xxs);
  static const Widget horizontalXS = SizedBox(width: xs);
  static const Widget horizontalSM = SizedBox(width: sm);
  static const Widget horizontalMD = SizedBox(width: md);
  static const Widget horizontalLG = SizedBox(width: lg);
  static const Widget horizontalXL = SizedBox(width: xl);
  static const Widget horizontalXXL = SizedBox(width: xxl);
  static const Widget horizontalXXXL = SizedBox(width: xxxl);
  static const Widget horizontalHuge = SizedBox(width: huge);

  // Vertical spacing widgets
  static const Widget verticalNone = SizedBox(height: none);
  static const Widget verticalXXXS = SizedBox(height: xxxs);
  static const Widget verticalXXS = SizedBox(height: xxs);
  static const Widget verticalXS = SizedBox(height: xs);
  static const Widget verticalSM = SizedBox(height: sm);
  static const Widget verticalMD = SizedBox(height: md);
  static const Widget verticalLG = SizedBox(height: lg);
  static const Widget verticalXL = SizedBox(height: xl);
  static const Widget verticalXXL = SizedBox(height: xxl);
  static const Widget verticalXXXL = SizedBox(height: xxxl);
  static const Widget verticalHuge = SizedBox(height: huge);

  // Padding values
  static const EdgeInsets paddingNone = EdgeInsets.all(none);
  static const EdgeInsets paddingXXXS = EdgeInsets.all(xxxs);
  static const EdgeInsets paddingXXS = EdgeInsets.all(xxs);
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);
  static const EdgeInsets paddingXXXL = EdgeInsets.all(xxxl);
  static const EdgeInsets paddingHuge = EdgeInsets.all(huge);

  // Horizontal padding values
  static const EdgeInsets paddingHorizontalXXXS = EdgeInsets.symmetric(
    horizontal: xxxs,
  );
  static const EdgeInsets paddingHorizontalXXS = EdgeInsets.symmetric(
    horizontal: xxs,
  );
  static const EdgeInsets paddingHorizontalXS = EdgeInsets.symmetric(
    horizontal: xs,
  );
  static const EdgeInsets paddingHorizontalSM = EdgeInsets.symmetric(
    horizontal: sm,
  );
  static const EdgeInsets paddingHorizontalMD = EdgeInsets.symmetric(
    horizontal: md,
  );
  static const EdgeInsets paddingHorizontalLG = EdgeInsets.symmetric(
    horizontal: lg,
  );
  static const EdgeInsets paddingHorizontalXL = EdgeInsets.symmetric(
    horizontal: xl,
  );
  static const EdgeInsets paddingHorizontalXXL = EdgeInsets.symmetric(
    horizontal: xxl,
  );
  static const EdgeInsets paddingHorizontalXXXL = EdgeInsets.symmetric(
    horizontal: xxxl,
  );
  static const EdgeInsets paddingHorizontalHuge = EdgeInsets.symmetric(
    horizontal: huge,
  );

  // Vertical padding values
  static const EdgeInsets paddingVerticalXXXS = EdgeInsets.symmetric(
    vertical: xxxs,
  );
  static const EdgeInsets paddingVerticalXXS = EdgeInsets.symmetric(
    vertical: xxs,
  );
  static const EdgeInsets paddingVerticalXS = EdgeInsets.symmetric(
    vertical: xs,
  );
  static const EdgeInsets paddingVerticalSM = EdgeInsets.symmetric(
    vertical: sm,
  );
  static const EdgeInsets paddingVerticalMD = EdgeInsets.symmetric(
    vertical: md,
  );
  static const EdgeInsets paddingVerticalLG = EdgeInsets.symmetric(
    vertical: lg,
  );
  static const EdgeInsets paddingVerticalXL = EdgeInsets.symmetric(
    vertical: xl,
  );
  static const EdgeInsets paddingVerticalXXL = EdgeInsets.symmetric(
    vertical: xxl,
  );
  static const EdgeInsets paddingVerticalXXXL = EdgeInsets.symmetric(
    vertical: xxxl,
  );
  static const EdgeInsets paddingVerticalHuge = EdgeInsets.symmetric(
    vertical: huge,
  );

  // Screen edge padding
  static const EdgeInsets screenEdgePadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: md,
  );
  static const EdgeInsets screenHorizontalPadding = EdgeInsets.symmetric(
    horizontal: md,
  );
  static const EdgeInsets screenVerticalPadding = EdgeInsets.symmetric(
    vertical: md,
  );

  // Form field spacing
  static const double formFieldSpacing = md;
  static const Widget formFieldGap = SizedBox(height: formFieldSpacing);

  // Button spacing
  static const double buttonSpacing = md;
  static const Widget buttonGap = SizedBox(width: buttonSpacing);

  // List item spacing
  static const double listItemSpacing = xs;
  static const Widget listItemGap = SizedBox(height: listItemSpacing);

  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(md);
}
