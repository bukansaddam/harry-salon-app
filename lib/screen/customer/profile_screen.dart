import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/model/detail_user.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/user_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/item_profile.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scrollController = ScrollController();
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);

    Future.microtask(() async {
      await userProvider.getDetailUser();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    await userProvider.getDetailUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: context.watch<AuthProvider>().isLoggedIn
          ? Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final state = userProvider.loadingState;
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: () {
                    final user = userProvider.userDetailResponse!.data;
                    return _buildBody(user);
                  },
                  error: (error) => Center(child: Text(error)),
                );
              },
            )
          : _buildDialogLogin(),
    );
  }

  Widget _buildBody(DetailUser user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildAvatar(user),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(user.phone.toString()),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ItemProfile(
                    onTap: () {
                      context.goNamed('edit_profile', extra: {
                        'user': user.name,
                        'title': 'Full Name',
                      });
                    },
                    title: 'Full Name',
                    subtitle: user.name,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ItemProfile(
                    onTap: () {
                      context.goNamed('edit_profile', extra: {
                        'user': user.email,
                        'title': 'Email',
                      });
                    },
                    title: 'Email',
                    subtitle: user.email,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ItemProfile(
                    onTap: () {
                      context.goNamed('edit_profile', extra: {
                        'user': user.address,
                        'title': 'Address',
                      });
                    },
                    title: 'Address',
                    subtitle: user.address,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ItemProfile(
                    onTap: () {
                      context.goNamed('edit_profile', extra: {
                        'user': user.phone.toString(),
                        'title': 'Phone',
                      });
                    },
                    title: 'Phone',
                    subtitle: user.phone.toString(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Preferences',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red[100],
                    ),
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text('Logout'),
                              content: const Text(
                                  'Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<AuthProvider>().logout();
                                    context.pop();
                                    _refreshData();
                                  },
                                  child: const Text('Logout'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogLogin() {
    return Center(
      child: TextButton(
        onPressed: () {
          context.goNamed('login');
        },
        child: const Text('Login'),
      ),
    );
  }

  Widget _buildAvatar(DetailUser user) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: Image.network(
            user.avatar.contains('http')
                ? user.avatar
                : '${ApiService.baseUrl}/${user.avatar}',
          ).image,
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () => _buildBottomSheet(context),
              child: ClipOval(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFF293869)),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Future<void> _buildBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  'Edit Image',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  _onCameraView();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  _onGalleryView();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onCameraView() async {
    final provider = context.read<UserProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (!mounted) return;
      provider.setImage(pickedFile);
      ToastMessage.show(context, 'Image updated');
    }
  }

  void _onGalleryView() async {
    final provider = context.read<UserProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null && mounted) {
      provider.setImage(pickedFile);
      ToastMessage.show(context, 'Image updated');
    }

    if (mounted) {
      context.pop();
    }
  }
}
