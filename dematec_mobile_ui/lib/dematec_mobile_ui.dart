library dematec_mobile_ui;

import 'package:flutter/material.dart';
import 'src/core/theme/theme.dart';

export 'src/core/constants/mapping_colors.dart';
export 'src/core/enums/text/dematec_ui_text_field_enum.dart';
export 'src/core/enums/text/dematec_ui_text_field_size_enum.dart';
export 'src/core/enums/text/dematec_ui_text_field_style_enum.dart';
export 'src/presentations/widgets/text_field/dematec_ui_text_field_custom.dart';
export 'src/presentations/widgets/text_field/dematec_ui_text_field_style.dart';
export 'src/presentations/widgets/text/body/dematec_ui_body_large_widget.dart';
export 'src/presentations/widgets/text/body/dematec_ui_body_medium_widget.dart';
export 'src/presentations/widgets/text/body/dematec_ui_body_small_widget.dart';
export 'src/presentations/widgets/text/hyperlink/dematec_ui_hiperlink_text_widget.dart';
export 'src/presentations/widgets/text/label/dematec_ui_label_large_widget.dart';
export 'src/presentations/widgets/text/label/dematec_ui_label_medium_widget.dart';
export 'src/presentations/widgets/text/label/dematec_ui_label_small_widget.dart';
export 'src/presentations/widgets/text/title/dematec_ui_title_large_widget.dart';
export 'src/presentations/widgets/text/title/dematec_ui_title_medium_widget.dart';
export 'src/presentations/widgets/text/title/dematec_ui_title_small_widget.dart';
export 'src/core/constants/paddings.dart';
export 'src/core/constants/images_constants.dart';
export 'src/core/enums/dematec_ui_size_widget.dart';
export 'src/core/enums/text/dematec_ui_hiperlink_text_type_widget_enum.dart';
export 'src/core/enums/dematec_ui_color_type_widget.dart';
export 'src/presentations/widgets/notification/dematec_ui_notification_body_widget.dart';
export 'src/presentations/widgets/checkbox/dematec_ui_checkbox_custom.dart';
export 'src/presentations/widgets/checkbox/dematec_ui_group_check_box.dart';
export 'src/presentations/widgets/checkbox/dematec_ui_style_check_box.dart';
export 'src/presentations/widgets/button/dematec_ui_button_custom.dart';
export 'src/presentations/widgets/button/dematec_ui_style_button.dart';
export 'src/core/enums/button/dematec_ui_type_button_widget.dart';
export 'src/presentations/widgets/circular_progress_indicator/dematec_ui_circular_progress_indicator_custom.dart';
export 'src/presentations/widgets/circular_progress_indicator/dematec_ui_circular_progress_indicator_style.dart';
export 'src/presentations/widgets/navigation_option/dematec_ui_navigation_option.dart';
export 'src/presentations/widgets/fields/search_field/dematec_ui_search_field.dart';
export 'src/presentations/widgets/more_options/dematec_ui_more_options.dart';
export 'src/presentations/widgets/more_options/dematec_ui_more_options_item.dart';

class DematecUi {
  static ThemeData get theme => dematecTheme;
}
