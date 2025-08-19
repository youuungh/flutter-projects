// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';
// import 'package:waviz_client/shared/widgets/project_large_widget.dart';
// import 'package:waviz_client/theme.dart';
// import 'package:waviz_client/presentation/notifiers/home/home_notifier.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final numberFormatter = NumberFormat('###,###,###,###');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               color: Colors.white,
//               height: 324,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: SizedBox(
//                             height: 40,
//                             child: TextFormField(
//                               onTap: () {},
//                               decoration: InputDecoration(
//                                 contentPadding: const EdgeInsets.symmetric(
//                                   horizontal: 16,
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(
//                                     color: AppColors.wavizGray[100]!,
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(
//                                     color: AppColors.wavizGray[100]!,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: const BorderSide(
//                                     color: AppColors.primary,
//                                   ),
//                                 ),
//                                 hintText: "새로운 일상이 필요하신가요?",
//                                 suffixIcon: const Icon(Icons.search),
//                                 suffixIconColor: AppColors.wavizGray[400],
//                               ),
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.notifications_none),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 16, bottom: 16),
//                       child: Consumer(
//                         builder: (context, ref, child) {
//                           final categories = ref.watch(
//                             fetchHomeCategoriesProvider,
//                           );
//                           return switch (categories) {
//                             AsyncData(:final value) => GridView.builder(
//                               scrollDirection: Axis.horizontal,
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                     crossAxisSpacing: 12,
//                                     mainAxisSpacing: 0,
//                                   ),
//                               itemCount: value.length,
//                               itemBuilder: (context, index) {
//                                 final data = value[index];
//                                 return InkWell(
//                                   onTap: () {
//                                     context.push("/home/category/${data.id}");
//                                   },
//                                   child: Column(
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 38,
//                                         backgroundColor: AppColors.bg,
//                                         child: Image.asset(
//                                           data.iconPath ?? "",
//                                           height: 42,
//                                           width: 42,
//                                         ),
//                                       ),
//                                       Gap(4),
//                                       Text(data.title ?? "??"),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             ),
//                             AsyncError(:final error) => Text("$error"),
//                             _ => Center(child: CircularProgressIndicator()),
//                           };
//                         },
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 48,
//                     height: 4,
//                     decoration: BoxDecoration(
//                       color: AppColors.bg,
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                   const Gap(12),
//                 ],
//               ),
//             ),
//             const Gap(12),
//             Expanded(
//               child: Consumer(
//                 builder: (context, ref, child) {
//                   // final project =
//                   //     ref.watch(homeViewModelProvider.notifier).fetchHomeData();
//
//                   final homeData = ref.watch(fetchHomeProjectProvider);
//
//                   return homeData.when(
//                     data: (data) {
//                       if (data.projects.isEmpty) {
//                         return Column(
//                           children: [
//                             Text("정보가 없습니다."),
//                             TextButton(onPressed: () {}, child: Text("새로고침")),
//                           ],
//                         );
//                       }
//                       return Container(
//                         color: Colors.white,
//                         child: ListView.builder(
//                           itemCount: 10,
//                           itemBuilder: (context, index) {
//                             final project = data.projects[index];
//                             return ProjectLargeWidget(
//                               projectDataString: jsonEncode(project.toJson()),
//                             );
//
//                             // return InkWell(
//                             //   onTap: () {
//                             //     context.push(
//                             //       "/detail",
//                             //       extra: json.encode(project.toJson()),
//                             //     );
//                             //   },
//                             //   child: Container(
//                             //     margin: const EdgeInsets.only(
//                             //       bottom: 8,
//                             //       left: 16,
//                             //       right: 16,
//                             //       top: 20,
//                             //     ),
//                             //     decoration: BoxDecoration(
//                             //       color: Colors.white,
//                             //       borderRadius: BorderRadius.circular(10),
//                             //       boxShadow: [
//                             //         BoxShadow(
//                             //           offset: const Offset(0, 8),
//                             //           color: Colors.black.withValues(alpha: .1),
//                             //           blurRadius: 30,
//                             //           spreadRadius: 4,
//                             //         ),
//                             //       ],
//                             //     ),
//                             //     child: Column(
//                             //       crossAxisAlignment: CrossAxisAlignment.start,
//                             //       children: [
//                             //         Container(
//                             //           height: 220,
//                             //           decoration: BoxDecoration(
//                             //             color: Colors.grey,
//                             //             borderRadius: BorderRadius.only(
//                             //               topLeft: Radius.circular(10),
//                             //               topRight: Radius.circular(10),
//                             //             ),
//                             //             image: DecorationImage(
//                             //               image: CachedNetworkImageProvider(
//                             //                 project?.thumbnail ?? "",
//                             //               ),
//                             //               fit: BoxFit.cover,
//                             //             ),
//                             //           ),
//                             //         ),
//                             //         Padding(
//                             //           padding: const EdgeInsets.all(16.0),
//                             //           child: Column(
//                             //             crossAxisAlignment:
//                             //                 CrossAxisAlignment.start,
//                             //             children: [
//                             //               Text(
//                             //                 project?.isOpen == "close"
//                             //                     ? "${numberFormatter.format(project?.waitlistCount)}명이 기다려요"
//                             //                     : "${numberFormatter.format(project?.totalFundedCount)}명이 인증했어요",
//                             //                 style: TextStyle(
//                             //                   fontWeight: FontWeight.w700,
//                             //                   fontSize: 18,
//                             //                   color: AppColors.primary,
//                             //                 ),
//                             //               ),
//                             //               const Gap(8),
//                             //               Text(
//                             //                 project?.title ??
//                             //                     "아이돌 관리비법 | 준비 안된 얼굴라인도 살리는 세럼",
//                             //               ),
//                             //               const Gap(16),
//                             //               Text(
//                             //                 project?.owner ?? "세상에 없던 브랜드",
//                             //                 style: TextStyle(
//                             //                   color: AppColors.wavizGray[500],
//                             //                 ),
//                             //               ),
//                             //               const Gap(16),
//                             //               Container(
//                             //                 decoration: BoxDecoration(
//                             //                   color: AppColors.bg,
//                             //                   borderRadius:
//                             //                       BorderRadius.circular(3),
//                             //                 ),
//                             //                 padding: const EdgeInsets.symmetric(
//                             //                   horizontal: 6,
//                             //                   vertical: 4,
//                             //                 ),
//                             //                 child: Text(
//                             //                   project?.isOpen == "close"
//                             //                       ? "오픈예정"
//                             //                       : "바로구매",
//                             //                   style: TextStyle(fontSize: 10),
//                             //                 ),
//                             //               ),
//                             //             ],
//                             //           ),
//                             //         ),
//                             //       ],
//                             //     ),
//                             //   ),
//                             // );
//                           },
//                         ),
//                       );
//                     },
//                     error: (error, trace) {
//                       switch (error) {
//                         case ConnectionTimeoutError():
//                           return globalErrorHandler(
//                             error as ErrorHandler,
//                             error as DioException,
//                             ref,
//                             fetchHomeProjectProvider,
//                           );
//                         // return Center(
//                         //   child: Text("${"$error"}\n$trace"),
//                         // );
//                         case ConnectionError():
//                           return Center(child: Text("$error"));
//                         case UnsupportedError():
//                           return Center(child: Text("$error"));
//                       }
//                       return globalErrorHandler(
//                         error as ErrorHandler,
//                         error as DioException,
//                         ref,
//                         fetchHomeProjectProvider,
//                       );
//                     },
//                     loading: () => Center(child: CircularProgressIndicator()),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// sealed class ErrorHandler {}
//
// class ConnectionTimeoutError extends ErrorHandler {
//   DioException exception;
//
//   ConnectionTimeoutError(this.exception);
// }
//
// class ConnectionError extends ErrorHandler {
//   DioException exception;
//
//   ConnectionError(this.exception);
// }
//
// Widget globalErrorHandler(
//   ErrorHandler? errorHandler,
//   DioException? exception,
//   WidgetRef? ref,
//   ProviderOrFamily? provider,
// ) {
//   return Padding(
//     padding: EdgeInsets.all(16),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text("${exception?.message}"),
//         if (ref != null)
//           TextButton(
//             onPressed: () {
//               if (provider != null) {
//                 ref.invalidate(provider);
//               }
//             },
//             child: Text("새로고침"),
//           ),
//         TextButton(
//           onPressed: () {
//             Clipboard.setData(
//               ClipboardData(text: exception?.stackTrace.toString() ?? ""),
//             );
//           },
//           child: Text("에러보고"),
//         ),
//       ],
//     ),
//   );
// }
