import 'package:cesarFlutter/app/common/app_colors/app_colors.dart';
import 'package:cesarFlutter/app/common/components/btn_play.dart';
import 'package:cesarFlutter/app/common/components/btn_share.dart';
import 'package:cesarFlutter/app/common/components/home_featured_track.dart';
import 'package:cesarFlutter/app/common/components/home_top_track.dart';
import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:cesarFlutter/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final homeController = Modular.get<HomeController>();
  var listFeaturedAlbum;

  @override
  void initState() {
    homeController.getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset("assets/images/home-header.png"),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: Image.asset("assets/icons/menu.png")
                ),
                Positioned(
                  top: 100,
                  left: 16,
                  child: Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "// TRENDING",
                          style: Styles.homeTrendingLabel,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Akcent Feat Lidia Bubble etclkasdlasdsla",
                          style: Styles.homeMusicLabel,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "- Kamelia",
                          style: Styles.homeArtistLabel,
                        ),
                      ],
                    ),
                  )
                ),
                Positioned(
                  bottom: 25,
                  left: 16,
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 62,
                        child: BtnPlay(() => {} ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 22,
                        width: 24,
                        child: BtnShare(() => {} ),
                      )
                    ],
                  )
                )
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    AppColors.defaultHomeBackgroundColor,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Featured Tracks",
                    style: Styles.homeTitleLabel,
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Observer(builder: (_) {
                      
                      if(homeController.ofFeaturedAlbums.error != null) {
                        return Center(child: Text(homeController.ofFeaturedAlbums.error.toString()));
                      }

                      if(homeController.ofFeaturedAlbums == null) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return ListView.builder(
                        padding: EdgeInsets.only(right: 15),
                        itemBuilder: (_, index) { return HomeFeaturedTrack(listFeaturedAlbum.data, index); },
                        itemCount: listFeaturedAlbum.data.length
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Top Tracks",
                    style: Styles.homeTitleLabel,
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: HomeTopTrack("assets/images/top_track_1.png", "Closer (feat. Halsey)", "The Chainsmokers feat. Halsey", "3:13"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: HomeTopTrack("assets/images/top_track_2.png", "7 Rings", "The Chainsmokers feat. Halsey", "3:13"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: HomeTopTrack("assets/images/top_track_3.png", "TAKITAKI", "Cardi B, Selena Gomez, Ozuna", "3:13"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}