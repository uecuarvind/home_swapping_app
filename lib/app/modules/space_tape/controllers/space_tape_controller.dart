import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_swipping/app/routes/app_pages.dart';
import 'package:home_swipping/common/common_widgets.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../common/image_file_picker.dart';

class SpaceTapeController extends GetxController {
  List<Widget> mediaList = [];
  final List<File> path=[];
  int currentPage = 0;
  List<File> selectedFile=[];
  List<int> selectIndexes=[];
  int? lastPage;

  final count = 0.obs;
  final isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchNewMedia(Get.context!);
    loadRecentImages();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnManage(BuildContext context) async{
    List<File>? pickedImages= await getMultipleImageFromGallery();
    if(pickedImages!=null){
      selectedFile=pickedImages;
    }else{
      CommonWidgets.showSnackBar(context: context,message:'Please select minimum one images...',status: false);
    }
  }

  changeSelected(int index){
    if(selectIndexes.contains(index)){
      selectIndexes.remove(index);
      removeFileByIndex(index);
    }else{
      selectIndexes.add(index);
      addFileByIndex(index);
    }
    increment();
  }
  void addFileByIndex(int index){
    selectedFile.add(path[index]);
  }
  void removeFileByIndex(int index){
    selectedFile.remove(path[index]);
  }
  bool imageSelected(int index){
    return selectIndexes.contains(index);
  }

  handleScrollEvent(ScrollNotification scroll,BuildContext context) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        fetchNewMedia(context);
      }
    }
  }

  fetchNewMedia(BuildContext context) async {
    lastPage = currentPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      selectedFile.clear();
      mediaList.clear();
      List<AssetPathEntity> albums =
      await PhotoManager.getAssetPathList(
          onlyAll: true);
      print(albums);
      List<AssetEntity> media  = await albums[0].getAssetListPaged(size: 60, page: currentPage); //preloading files
      print(media);
      for(var asset in media){
        if(asset.type== AssetType.image){
          final file= await asset.file;
          if(file!=null){
            path.add(File(file.path));
            changeSelected(0);
          }
        }
      }
      // print("image path:-"+media[0]!.thumbnailDataWithSize(const ThumbnailSize(200, 200)).asStream().toString());
      // Future<File?> filename=media[0].file;
      // print("image path:-"+filename.toString());

      List<Widget> temp = [];
      for (var asset in media) {
        if(asset.type==AssetType.image){
          temp.add(
            FutureBuilder(
              future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)), //resolution of thumbnail
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // File file=File.fromRawPath(snapshot.data!);
                  // print("File path:-"+file.uri.path);
                  return Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (asset.type == AssetType.video)
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5, bottom: 5),
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  );
                }
                return Container();
              },
            ),
          );
        }
      }
      mediaList.addAll(temp);
      currentPage++;
      isLoading.value=false;
      increment();

    } else {
      CommonWidgets.showSnackBar(context: context,message:'Please open setting and give permission...',status: false);
      PhotoManager.openSetting();
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  Future<void> loadRecentImages() async {

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    if (albums.isNotEmpty) {
      List<AssetEntity> recentImages = await albums.first.getAssetListRange(
        start: 0,
        end: 10, // Fetch the first 10 images
      );
      recentImages = recentImages;
      print("Length"+recentImages.length.toString());
    }
  }

  onTapCreate(){
    //Get.toNamed(Routes.SHARE_SPACE_TAPE,arguments: selectedFile);
    Get.toNamed(Routes.SPACE_TAPE_EDIT,arguments: selectedFile);
  }
}
