import 'package:riverpod_project/Instagram-app/views/components/animations/models/lotie_animation.dart';

import './lotie_animation_view.dart';

class ErrorAnimationView extends LotieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LotieAnimation.error,
        );
}
