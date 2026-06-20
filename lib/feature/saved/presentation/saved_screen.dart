import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/feature/home/widgets/author_chip.dart';
import 'package:nick_me/feature/saved/widgets/saved_quote_card.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nick_me/networks/api_acess.dart';
import 'package:nick_me/feature/home/model/wisdom_authors_model.dart' as authors_model;
import 'package:nick_me/feature/saved/model/all_saved_stoic_model.dart';
import 'package:nick_me/helpers/loding_indicator_widgets.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});
  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  String _selectedAuthor = "All";
  final Box<String> _authorsBox = Hive.box<String>('wisdomAuthorsCache');

  @override
  void initState() {
    super.initState();
    getWisdomSaveListRxObj.getSavedWisdomList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.splashScreen),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "COLLECTED",
                    style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                      color: AppColor.cFFFFFF.withValues(alpha: 0.4),
                      letterSpacing: 2.0,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Saved Stoic Quotes",
                    style: TextFontStyle.textStyle28cFFFFFFPlayfairW400
                        .copyWith(fontSize: 32.sp),
                  ),
                  SizedBox(height: 24.h),
                  StreamBuilder<authors_model.WisdomAuthorsModel>(
                    stream: getWisdomAuthorsRXObj.wisdomAuthors,
                    builder: (context, snapshot) {
                      final cachedJson = _authorsBox.get('authorsJson');

                      Widget buildHorizontalList(List<String> list) {
                        final fullList = ["All", ...list];
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: fullList.map((author) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: AuthorChip(
                                  label: author,
                                  isActive: _selectedAuthor == author,
                                  onTap: () {
                                    setState(() {
                                      _selectedAuthor = author;
                                    });
                                    if (author == "All") {
                                      getWisdomSaveListRxObj.getSavedWisdomList(
                                        authorSlug: null,
                                      );
                                    } else {
                                      final authorsList = getWisdomAuthorsRXObj
                                              .wisdomAuthors
                                              .valueOrNull
                                              ?.data
                                              ?.authors ??
                                          [];
                                      final matchingAuthor =
                                          authorsList.firstWhere(
                                        (a) => a.name == author,
                                        orElse: () =>
                                            authors_model.Author(slug: null, name: null),
                                      );
                                      getWisdomSaveListRxObj.getSavedWisdomList(
                                        authorSlug: matchingAuthor.slug,
                                      );
                                    }
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        if (cachedJson != null && cachedJson.isNotEmpty) {
                          try {
                            final cachedModel = authors_model.WisdomAuthorsModel.fromRawJson(
                              cachedJson,
                            );
                            final cachedAuthors =
                                cachedModel.data?.authors
                                    ?.map((author) => author.name ?? '')
                                    .where((name) => name.isNotEmpty)
                                    .toList() ??
                                [];
                            if (cachedAuthors.isNotEmpty) {
                              return buildHorizontalList(cachedAuthors);
                            }
                          } catch (e) {
                            // ignore
                          }
                        }
                        return const Center(child: CircularProgressIndicator());
                      }

                      List<String> authors = [];
                      if (snapshot.hasData &&
                          snapshot.data?.data?.authors != null) {
                        authors = snapshot.data!.data!.authors!
                            .map((author) => author.name ?? '')
                            .where((name) => name.isNotEmpty)
                            .toList();
                      } else if (snapshot.hasError) {
                        if (cachedJson != null && cachedJson.isNotEmpty) {
                          try {
                            final cachedModel = authors_model.WisdomAuthorsModel.fromRawJson(
                              cachedJson,
                            );
                            final cachedAuthors =
                                cachedModel.data?.authors
                                    ?.map((author) => author.name ?? '')
                                    .where((name) => name.isNotEmpty)
                                    .toList() ??
                                [];
                            if (cachedAuthors.isNotEmpty) {
                              return buildHorizontalList(cachedAuthors);
                            }
                          } catch (e) {
                            // ignore
                          }
                        }
                      }

                      return buildHorizontalList(authors);
                    },
                  ),

                  SizedBox(height: 30.h),
                  StreamBuilder<AllSavedStoicModel>(
                    stream: getWisdomSaveListRxObj.savedWisdomList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 200.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              "Failed to load saved quotes. Please try again.",
                              style: TextFontStyle.textStyle14cFFFFFFInterW500
                                  .copyWith(color: Colors.redAccent),
                            ),
                          ),
                        );
                      }

                      final items = snapshot.data?.data?.items ?? [];
                      if (items.isEmpty) {
                        return SizedBox(
                          height: 200.h,
                          child: Center(
                            child: Text(
                              "No saved quotes found.",
                              style: TextFontStyle.textStyle14cFFFFFFInterW500
                                  .copyWith(
                                color: AppColor.cFFFFFF.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: items.map((item) {
                          return SavedQuoteCard(
                            quote: item.wisdom?.stoic ?? "",
                            author: item.author?.name ?? "Unknown Author",
                            source: item.wisdom?.book ?? "",
                            isFavorite: item.isSaved ?? true,
                            onFavoriteTap: () async {
                              final slug = item.wisdom?.slug;
                              if (slug != null && slug.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) =>
                                      loadingIndicatorCircle(context: context),
                                );
                                bool success = await getSaveWisdomRxObj
                                    .saveWisdom(stoicSlug: slug);
                                if (context.mounted) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                }
                                if (success) {
                                  // Refresh the current list
                                  if (_selectedAuthor == "All") {
                                    getWisdomSaveListRxObj.getSavedWisdomList(
                                      authorSlug: null,
                                    );
                                  } else {
                                    final authorsList = getWisdomAuthorsRXObj
                                            .wisdomAuthors
                                            .valueOrNull
                                            ?.data
                                            ?.authors ??
                                        [];
                                    final matchingAuthor =
                                        authorsList.firstWhere(
                                      (a) => a.name == _selectedAuthor,
                                      orElse: () =>
                                          authors_model.Author(slug: null, name: null),
                                    );
                                    getWisdomSaveListRxObj.getSavedWisdomList(
                                      authorSlug: matchingAuthor.slug,
                                    );
                                  }
                                }
                              }
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                  SizedBox(height: 100.h), // Bottom nav spacer
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
