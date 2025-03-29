import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quillhub/models/auth_state.dart';
import 'package:quillhub/providers/auth_provider.dart';

class ProfileButtonWidget extends ConsumerWidget {
  const ProfileButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final ImageProvider avatarImage = (authState.status == AuthStatus.authenticated)
        ? NetworkImage(authState.user!.image ?? '')
        : const AssetImage('assets/images/male-avatar.png');
    return InkWell(
      onTap: () {
        if(authState.status == AuthStatus.authenticated) {
          context.goNamed('user_profile');
        } else {
          context.goNamed('login');
        }
      },
      child: CircleAvatar(
        radius: 20,
        backgroundImage: avatarImage,
      ),
    );
  }
}