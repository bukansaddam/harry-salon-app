import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  final ScrollController _scrollController = ScrollController();
  late UserProvider userProvider;

  final actor = const String.fromEnvironment('actor', defaultValue: 'customer');

  bool get isOwner => actor == 'owner';
  bool get isEmployee => actor == 'employee';
  bool get isCustomer => actor == 'customer';

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();

    Future.microtask(() async {
      await _refreshData();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    await userProvider.getDetailUser();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isOwner
            ? null
            : AppBar(
                title: const Text('Profile'),
              ),
        body: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            final state = userProvider.loadingState;
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: () {
                final user = userProvider.userDetailResponse!.data;
                return _buildBody(user);
              },
              error: (error) => _buildDialogLogin(error),
            );
          },
        ));
  }

  Widget _buildBody(DetailUser user) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                  _buildProfileItem('Full Name', user.name, () {
                    _navigateToEditProfile(user.name, 'Full Name');
                  }, true),
                  _buildDivider(),
                  _buildProfileItem('Email', user.email, () {}, false),
                  _buildDivider(),
                  _buildProfileItem('Address', user.address, () {
                    _navigateToEditProfile(user.address, 'Address');
                  }, true),
                  _buildDivider(),
                  _buildProfileItem('Phone', user.phone.toString(), () {
                    _navigateToEditProfile(user.phone.toString(), 'Phone');
                  }, true),
                  _buildDivider(),
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
                  _buildLogoutItem(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(
      String title, String subtitle, VoidCallback onTap, bool isEdited) {
    return ItemProfile(
      onTap: onTap,
      title: title,
      subtitle: subtitle,
      isEdited: isEdited,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 0,
    );
  }

  Widget _buildLogoutItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red[100],
      ),
      child: ListTile(
        onTap: _showLogoutDialog,
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
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await context.read<AuthProvider>().logout().then((_) {
                  context.pop();
                  setState(() {
                    _refreshData();
                  });
                });
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogLogin(String error) {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              context.goNamed('login');
            },
            child: const Text('Login'),
          ),
          Text(error),
        ],
      ),
    );
  }

  Widget _buildAvatar(DetailUser user) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: Image.network(
            user.avatar,
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
          ),
        ),
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
      Navigator.pop(context);
    }
  }

  void _navigateToEditProfile(String initialValue, String title) {
    context.goNamed('edit_profile', extra: {
      'user': initialValue,
      'title': title,
    });
  }
}
