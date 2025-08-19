import 'package:flutter/material.dart';
import 'package:waviz_client/core/widgets/widgets.dart';
import 'package:waviz_client/domain/entity/project/project_entity.dart';

class ProjectDetailWidget extends StatelessWidget {
  final ProjectEntity data;

  const ProjectDetailWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 프로젝트 기본 정보
        ProjectHeaderInfo(data: data),
        
        // 구분선
        const ProjectDivider(),
        
        // 펀딩 진행 현황
        ProjectFundingProgress(data: data),
        
        // 구분선
        const ProjectDivider(),
        
        // 프로젝트 스토리
        ProjectStorySection(data: data),
        
        // 하단 여백
        const SizedBox(height: 8),
      ],
    );
  }
}
