import 'package:riverpod_project/Instagram-app/views/components/animations/models/lotie_animation.dart';

import './lotie_animation_view.dart';

class LoadingAnimationView extends LotieAnimationView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LotieAnimation.loading,
        );
}
