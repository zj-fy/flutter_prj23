import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../utils/g.dart';

class Mine extends StatefulWidget {
  Mine({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  double iconSize = 20;
  final ImagePicker picker = ImagePicker();
  File? _image;
  Map userInfo = {};

  @override
  Widget build(BuildContext context) {
    var isLogin = context.read<UserProvider>().isLogin;
    if (isLogin) {
      // 已登录，获取用户信息
      userInfo = context.read<UserProvider>().userInfo;
    } else {
      // 未登录，跳转到登录页
      Future.delayed(Duration(milliseconds: 500), () {
        G.router.navigateTo(context, '/login');
      });
    }

    return Container(
      // color: Colors.amberAccent,
        padding: EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            physics: BouncingScrollPhysics(),
            child: Column(
                children: [
                  _renderUserHeader(),
                  _renderListMenu(context),
                ]
            )
        )
    );
  }

  // 用户头部信息
  Widget _renderUserHeader() {

    Image _targetImage;

    if (_image != null) {
      _targetImage = FileImage(_image!, scale: 1) as Image;
    } else {
      if (userInfo.isNotEmpty) {
        _targetImage = Image.network(userInfo["avatar"].toString());
      } else {
        _targetImage = Image.asset("assets/flutter.jpg");
      }
    }

    return Container(
        margin: EdgeInsets.all(20),
        child: Center(
            child: InkWell(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _targetImage.image
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return renderBottomSheet(context);
                    }
                );
              },
            )
        )
    );
  }

  // 渲染列表菜单
  Widget _renderListMenu(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.verified_user, size: iconSize),
          title: Text("用户名：" + (userInfo.isNotEmpty ? userInfo["username"].toString() : "-")),
        ),
        ListTile(
          leading: Icon(Icons.email, size: iconSize),
          title: Text("E-Mail：" + (userInfo.isNotEmpty ? userInfo["email"].toString() : "-")),
        ),
        ListTile(
          leading: Icon((userInfo.isNotEmpty ? Icons.logout: Icons.login), size: iconSize),
          title: Text((userInfo.isNotEmpty ? '退出' : '登陆')),
          trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
          onTap: () async {
               context.read<UserProvider>().logout();
               G.router.navigateTo(context, '/login');
          },
        ),
      ],
    );
  }

  Widget renderBottomSheet(BuildContext context) {
    return Container(
        height: 160,
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  _takePhoto();
                  G.router.pop(context);
                },
                child: Container(
                  child: Text('拍照'),
                  height: 50,
                  alignment: Alignment.center,
                )
            ),
            InkWell(
                onTap: () {
                  _openGallery();
                  G.router.pop(context);
                },
                child: Container(
                  child: Text('从相册中选取'),
                  height: 50,
                  alignment: Alignment.center,
                )
            ),
            Container(
              color: Colors.grey[200],
              height: 10,
            ),
            InkWell(
                onTap: () {
                  G.router.pop(context);
                },
                child: Container(
                  child: Text('取消'),
                  height: 50,
                  alignment: Alignment.center,
                )
            )
          ],
        )
    );
  }

  // 拍照获取图片
  Future _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    // 图片选中后，才上传（如果未选中图片，则不作任何处理）
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _uploadImage(pickedFile);
      });
    } else {
      print('No Image');
    }
  }

  // 在相册中选取一张图片
  Future _openGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // 图片选中后，才上传（如果未选中图片，则不作任何处理）
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _uploadImage(pickedFile);
      });
    } else {
      print('No Image');
    }
  }

  // 上传图片
  void _uploadImage(pickedFile) async {
    String fileName = pickedFile.path.split('/').last.toString();
    // String? suffix = fileName.split('.').last.toString();
    print(fileName);
    // var res = await G.api.public.uploadImage(pickedFile.path, fileName);
    // if (res['status'] == 200) {
    //   EasyLoading.showSuccess('上传成功');
    //   print('imageURL：'+res['data']['url']);
    //   _avatar = res['data']['url'];
    // }
  }
}