import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../themes/color_style.dart';
import '../../view_model/login_provider.dart';
import 'personal_details_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNews = true;
  File? _image;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image, // view file gambar
      allowMultiple: false, // cuma pilih 1 image
    );

    if (result == null) return;

    final file = result.files.first;
    setState(() {
      _image = File(file.path!);
    });

    print('Nama file: ${file.name}');
  }

  Widget _buildPreview() {
    if (_image != null) {
      return CircleAvatar(
        radius: 50,
        backgroundImage: FileImage(_image!),
      );
    } else {
      return const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/default_image.jpg'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.9,
        title: Text('Profile', style: ThemeText.heading1),
        backgroundColor: const Color(0xFFF6F6F6),
      ),
      body: SingleChildScrollView(
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, _) {
            final user = loginProvider.userLogin;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  width: 400,
                  height: 180,
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child:
                                        _buildPreview(), // get fungsi image;)
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        _pickFile();
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0XFFFF7F00),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              title: Text(
                                user?.name ?? '',
                                style: ThemeText.headingName,
                              ),
                              subtitle: Text(
                                user?.email ?? '',
                                style: ThemeText.headingOld,
                              ),
                            ),
                            const Divider(
                              color: Color(0xffA5A5A5),
                              thickness: 1,
                              indent: 16,
                              endIndent: 16,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Current Weight',
                                  style: ThemeText.headingOld,
                                ),
                                Text(
                                  (user?.weight ?? 0).toString(),
                                  style: ThemeText.headingOld,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Current Goal Weight',
                                  style: ThemeText.headingOld,
                                ),
                                Text(
                                  (user?.goal_weight ?? 0).toString(),
                                  style: ThemeText.headingOld,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customization',
                        style: ThemeText.headingCustom,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Personal Details',
                            style: ThemeText.headingAccount,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PersonalDetailsScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xffA5A5A5),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Membership',
                            style: ThemeText.headingAccount,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color(0xffA5A5A5),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Newsletter',
                            style: ThemeText.headingAccount,
                          ),
                          Switch(
                            value: isNews,
                            inactiveTrackColor: const Color(0xffD9D9D9),
                            inactiveThumbColor: const Color(0xffF6F6F6),
                            activeTrackColor: const Color(0XFFFF7F00),
                            activeColor: const Color(0xffF6F6F6),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (bool value) {
                              setState(() {
                                isNews = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xffFF7F00)),
                    onPressed: () {
                      LoginProvider loginProvider =
                          Provider.of<LoginProvider>(context, listen: false);
                      loginProvider.logout(params: 0, context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFFF6F6F6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
