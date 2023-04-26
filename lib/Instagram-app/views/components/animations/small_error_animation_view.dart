import 'package:riverpod_project/Instagram-app/views/components/animations/models/lotie_animation.dart';

import './lotie_animation_view.dart';

class SmallErrorAnimationView extends LotieAnimationView {
  const SmallErrorAnimationView({super.key})
      : super(
          animation: LotieAnimation.smallError,
        );
}
