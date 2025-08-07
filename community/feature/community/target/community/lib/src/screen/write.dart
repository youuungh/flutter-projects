import 'package:core_util/util.dart';
import 'package:community_domain/domain.dart';
import 'package:feature_community/community.dart';
import 'package:flutter/material.dart';
import 'package:tool_community_component/component.dart';
import 'package:tool_community_theme/gen/gen.dart';
import 'package:tool_community_theme/theme.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setupListeners();
      _refresh();
    });
  }

  void _setupListeners() {
    final writePostViewModel = Provider.of<WritePostViewModel>(
      context,
      listen: false,
    );

    bool wasLoading = false;

    writePostViewModel.addListener(() {
      final post = writePostViewModel.value;
      final isLoading = writePostViewModel.isLoading;

      if (isLoading && !wasLoading) {
        CommunityLoadingDialog.show(context);
        wasLoading = true;
      }
      else if (!isLoading && wasLoading) {
        wasLoading = false;

        if (post != null && post.id.isNotEmpty) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          ICommunityDetailRouteTo.post(id: post.id);
        } else {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
      }
    });
  }

  void _hideKeyboard() {
    final List<FocusNode> focusNodes = [
      FocusScope.of(context),
      FocusManager.instance.primaryFocus,
    ].whereType<FocusNode>().toList();

    for (final FocusNode focusNode in focusNodes) {
      focusNode.unfocus();
    }
  }

  Future<void> _refresh() async {
    await Future.wait([
      Provider.of<WritePostViewModel>(context, listen: false).load(),
      Provider.of<WriteMyViewModel>(context, listen: false).load(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WritePostViewModel>(
      builder: (context, writePostViewModel, child) {
        return Scaffold(
          backgroundColor: context.colorScheme.bg2,
          appBar: CommunityAppBar(
            context: context,
            leading: CommunityAppBarTextButton(
              text: '취소',
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0),
              color: context.colorScheme.gray100,
              onTap: () => Navigator.of(context).pop(),
            ),
            leadingWidth: 56.0,
            actions: [
              Consumer<WritePostViewModel>(
                builder: (context, viewModel, child) {
                  final Post post = viewModel.value ?? Post.empty();
                  return CommunityAppBarTextButton(
                    text: '등록',
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    color: post.isActive
                        ? ColorName.blue
                        : context.colorScheme.gray600,
                    onTap: () {
                      if (!post.isActive) return;
                      CommunityDialog.showConfirm(
                        context,
                        title: "'${post.channel}'에 글을 등록하시겠습니까?",
                        onConfirm: () {
                          viewModel.publish();
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
          body: GestureDetector(
            onTap: _hideKeyboard,
            behavior: HitTestBehavior.translucent,
            child: SizedBox.expand(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
                    GestureDetector(
                      onTap: () {
                        final Post post =
                            writePostViewModel.value ?? Post.empty();
                        writePostViewModel.update(
                          channel: post.channel.isEmpty ? '자유게시판' : '',
                        );
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 48.0,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 16.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Consumer<WritePostViewModel>(
                                  builder: (context, viewModel, child) {
                                    final Post post =
                                        viewModel.value ?? Post.empty();
                                    return Text(
                                      post.channel.isEmpty
                                          ? '등록 위치를 선택하세요'
                                          : post.channel,
                                      style: context.textTheme.default16SemiBold
                                          .copyWith(
                                            color: context.colorScheme.gray100,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    );
                                  },
                                ),
                              ),
                              CommunityIcon.expandMore(
                                color: context.colorScheme.gray400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CommunityDivider.horizontal(),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<WritePostViewModel>(
                            builder: (context, writePostVM, child) {
                              final Post post =
                                  writePostVM.value ?? Post.empty();
                              if (post.channel.isNotEmpty) {
                                return const SizedBox.shrink();
                              }
                              return Consumer<WriteMyViewModel>(
                                builder: (context, writeMyVM, child) {
                                  final User user =
                                      writeMyVM.value ?? const User();
                                  if (user.name.isEmpty) {
                                    return const SizedBox.shrink();
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 20.0,
                                    ),
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: user.company.trim().isNotEmpty
                                                ? '작성자: ${user.name} · '
                                                : '작성자: ${user.name}',
                                            style: context
                                                .textTheme
                                                .default12Regular
                                                .copyWith(
                                                  color: context
                                                      .colorScheme
                                                      .gray600,
                                                ),
                                          ),
                                          if (user.company.trim().isNotEmpty)
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.baseline,
                                              baseline: TextBaseline.alphabetic,
                                              child: Transform.translate(
                                                offset: const Offset(0, 1),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 6.0,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4.0,
                                                        ),
                                                    border: Border.all(
                                                      color: ColorName.blue,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    user.company,
                                                    style: context
                                                        .textTheme
                                                        .default12Regular
                                                        .copyWith(
                                                          color: ColorName.blue,
                                                          height: 1.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          CoreTextField(
                            cursorColor: context.colorScheme.white,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: '제목을 입력해주세요.',
                              hintStyle: context.textTheme.default17SemiBold
                                  .copyWith(color: context.colorScheme.gray600),
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                            ),
                            style: context.textTheme.default17SemiBold.copyWith(
                              color: context.colorScheme.gray100,
                            ),
                            keyboardAppearance: context.colorScheme.brightness,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) =>
                                writePostViewModel.update(title: value),
                            onSubmitted: (value) =>
                                writePostViewModel.update(title: value),
                          ),
                          const SizedBox(height: 20.0),
                          CoreTextField(
                            cursorColor: context.colorScheme.white,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: '내용을 입력해주세요.',
                              hintStyle: context.textTheme.default15Medium
                                  .copyWith(color: context.colorScheme.gray600),
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                            ),
                            style: context.textTheme.default15Medium.copyWith(
                              color: context.colorScheme.gray100,
                            ),
                            keyboardAppearance: context.colorScheme.brightness,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value) =>
                                writePostViewModel.update(content: value),
                            onSubmitted: (value) =>
                                writePostViewModel.update(content: value),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.viewPaddingOf(context).bottom),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

extension on Post {
  bool get isActive =>
      channel.isNotEmpty && title.isNotEmpty && content.isNotEmpty;
}

// import 'package:core_flutter_bloc/flutter_bloc.dart';
// import 'package:core_util/util.dart';
// import 'package:community_domain/domain.dart';
// import 'package:feature_community/community.dart';
// import 'package:flutter/material.dart';
// // import 'package:community_presentation/presentation.dart';
// import 'package:tool_community_component/component.dart';
// import 'package:tool_community_theme/gen/gen.dart';
// import 'package:tool_community_theme/theme.dart';
//
// class WriteScreen extends StatefulWidget {
//   const WriteScreen({super.key});
//
//   @override
//   State<WriteScreen> createState() => _WriteScreenState();
// }
//
// class _WriteScreenState extends State<WriteScreen> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       _refresh();
//     });
//     super.initState();
//   }
//
//   void _hideKeyboard() {
//     final List<FocusNode> focusNodes = [
//       FocusScope.of(context),
//       FocusManager.instance.primaryFocus,
//     ].whereType<FocusNode>().toList();
//
//     for (final FocusNode focusNode in focusNodes) {
//       focusNode.unfocus();
//     }
//   }
//
//   Future<void> _refresh() async {
//     await Future.wait([
//       // context.readFlowBloc<WritePostCubit>().load(),
//       // context.readFlowBloc<WriteMyCubit>().load(),
//       Provider.of<WritePostViewModel>(context, listen: false).load(),
//       Provider.of<WriteMyViewModel>(context, listen: false).load(),
//     ]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FlowBlocListener<WritePostCubit, Post>(
//       listener: (context, state) {
//         if (state is LoadingState<Post>) {
//           CommunityLoadingDialog.show(context);
//         } else if (state is DataState<Post>) {
//           final Post post = state.data;
//           if (post.id.isNotEmpty) {
//             Navigator.of(context).pop();
//             Navigator.of(context).pop();
//
//             ICommunityDetailRouteTo.post(
//               // context,
//               id: post.id,
//             );
//           }
//         } else if (state is ErrorState<Post>) {
//           Navigator.of(context).pop();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: context.colorScheme.bg2,
//         appBar: CommunityAppBar(
//           context: context,
//           leading: CommunityAppBarTextButton(
//             text: '취소',
//             alignment: Alignment.centerLeft,
//             padding: const EdgeInsets.only(
//               left: 20.0,
//             ),
//             color: context.colorScheme.gray100,
//             onTap: () => Navigator.of(context).pop(),
//           ),
//           leadingWidth: 56.0,
//           actions: [
//             FlowBlocBuilder<WritePostCubit, Post>(
//               builder: (context, state) {
//                 final Post post = state.data ?? Post.empty();
//                 return CommunityAppBarTextButton(
//                   text: '등록',
//                   alignment: Alignment.centerRight,
//                   padding: const EdgeInsets.only(
//                     right: 20.0,
//                   ),
//                   color: post.isActive
//                       ? ColorName.blue
//                       : context.colorScheme.gray600,
//                   onTap: () {
//                     if (!post.isActive) return;
//                     CommunityDialog.showConfirm(
//                       context,
//                       title: "'${post.channel}'에 글을 등록하시겠습니까?",
//                       onConfirm: () {
//                         context.readFlowBloc<WritePostCubit>().publish();
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//         body: GestureDetector(
//           onTap: _hideKeyboard,
//           behavior: HitTestBehavior.translucent,
//           child: SizedBox.expand(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 5.0,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       final WritePostCubit cubit = context
//                           .readFlowBloc<WritePostCubit>();
//                       final Post post = cubit.state.data ?? Post.empty();
//                       cubit.update(
//                         channel: post.channel.isEmpty ? '자유게시판' : '',
//                       );
//                     },
//                     behavior: HitTestBehavior.translucent,
//                     child: Container(
//                       height: 48.0,
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           left: 20.0,
//                           right: 16.0,
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: FlowBlocBuilder<WritePostCubit, Post>(
//                                 builder: (context, state) {
//                                   final Post post = state.data ?? Post.empty();
//                                   return Text(
//                                     post.channel.isEmpty
//                                         ? '등록 위치를 선택하세요'
//                                         : post.channel,
//                                     style: context.textTheme.default16SemiBold
//                                         .copyWith(
//                                           color: context.colorScheme.gray100,
//                                         ),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   );
//                                 },
//                               ),
//                             ),
//                             CommunityIcon.expandMore(
//                               color: context.colorScheme.gray400,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   CommunityDivider.horizontal(),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20.0,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         FlowBlocBuilder<WritePostCubit, Post>(
//                           builder: (context, state) {
//                             final Post post = state.data ?? Post.empty();
//                             if (post.channel.isNotEmpty) {
//                               return const SizedBox.shrink();
//                             }
//                             return FlowBlocBuilder<WriteMyCubit, User>(
//                               builder: (context, state) {
//                                 final User user = state.data ?? const User();
//                                 if (user.name.isEmpty) {
//                                   return const SizedBox.shrink();
//                                 }
//                                 return Padding(
//                                   padding: const EdgeInsets.only(
//                                     bottom: 20.0,
//                                   ),
//                                   child: Text.rich(
//                                     TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: user.company.trim().isNotEmpty
//                                               ? '작성자: ${user.name} · '
//                                               : '작성자: ${user.name}',
//                                           style: context
//                                               .textTheme
//                                               .default12Regular
//                                               .copyWith(
//                                                 color:
//                                                     context.colorScheme.gray600,
//                                               ),
//                                         ),
//                                         if (user.company.trim().isNotEmpty)
//                                           WidgetSpan(
//                                             alignment:
//                                                 PlaceholderAlignment.baseline,
//                                             baseline: TextBaseline.alphabetic,
//                                             child: Transform.translate(
//                                               offset: const Offset(0, 1),
//                                               child: Container(
//                                                 padding: const EdgeInsets.symmetric(
//                                                   horizontal: 6.0,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                         4.0,
//                                                       ),
//                                                   border: Border.all(
//                                                     color: ColorName.blue,
//                                                   ),
//                                                 ),
//                                                 child: Text(
//                                                   user.company,
//                                                   style: context
//                                                       .textTheme
//                                                       .default12Regular
//                                                       .copyWith(
//                                                         color: ColorName.blue,
//                                                         height: 1.0,
//                                                       ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                         CoreTextField(
//                           cursorColor: context.colorScheme.white,
//                           decoration: InputDecoration(
//                             isDense: true,
//                             hintText: '제목을 입력해주세요.',
//                             hintStyle: context.textTheme.default17SemiBold
//                                 .copyWith(
//                                   color: context.colorScheme.gray600,
//                                 ),
//                             contentPadding: EdgeInsets.zero,
//                             border: InputBorder.none,
//                           ),
//                           style: context.textTheme.default17SemiBold.copyWith(
//                             color: context.colorScheme.gray100,
//                           ),
//                           keyboardAppearance: context.colorScheme.brightness,
//                           textInputAction: TextInputAction.next,
//                           onChanged: (value) => context
//                               .readFlowBloc<WritePostCubit>()
//                               .update(title: value),
//                           onSubmitted: (value) => context
//                               .readFlowBloc<WritePostCubit>()
//                               .update(title: value),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         CoreTextField(
//                           cursorColor: context.colorScheme.white,
//                           decoration: InputDecoration(
//                             isDense: true,
//                             hintText: '내용을 입력해주세요.',
//                             hintStyle: context.textTheme.default15Medium.copyWith(
//                               color: context.colorScheme.gray600,
//                             ),
//                             contentPadding: EdgeInsets.zero,
//                             border: InputBorder.none,
//                           ),
//                           style: context.textTheme.default15Medium.copyWith(
//                             color: context.colorScheme.gray100,
//                           ),
//                           keyboardAppearance: context.colorScheme.brightness,
//                           textInputAction: TextInputAction.newline,
//                           keyboardType: TextInputType.multiline,
//                           maxLines: null,
//                           onChanged: (value) => context
//                               .readFlowBloc<WritePostCubit>()
//                               .update(content: value),
//                           onSubmitted: (value) => context
//                               .readFlowBloc<WritePostCubit>()
//                               .update(content: value),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.viewPaddingOf(context).bottom,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// extension on Post {
//   bool get isActive =>
//       channel.isNotEmpty && title.isNotEmpty && content.isNotEmpty;
// }
