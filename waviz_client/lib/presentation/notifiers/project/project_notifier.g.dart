// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailNotifierHash() =>
    r'30c1aa0010ad26b07109bceaacdfbaa68f9b9c48';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProjectDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ProjectEntity?> {
  late final String id;

  FutureOr<ProjectEntity?> build(String id);
}

/// See also [ProjectDetailNotifier].
@ProviderFor(ProjectDetailNotifier)
const projectDetailNotifierProvider = ProjectDetailNotifierFamily();

/// See also [ProjectDetailNotifier].
class ProjectDetailNotifierFamily extends Family<AsyncValue<ProjectEntity?>> {
  /// See also [ProjectDetailNotifier].
  const ProjectDetailNotifierFamily();

  /// See also [ProjectDetailNotifier].
  ProjectDetailNotifierProvider call(String id) {
    return ProjectDetailNotifierProvider(id);
  }

  @override
  ProjectDetailNotifierProvider getProviderOverride(
    covariant ProjectDetailNotifierProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectDetailNotifierProvider';
}

/// See also [ProjectDetailNotifier].
class ProjectDetailNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProjectDetailNotifier,
          ProjectEntity?
        > {
  /// See also [ProjectDetailNotifier].
  ProjectDetailNotifierProvider(String id)
    : this._internal(
        () => ProjectDetailNotifier()..id = id,
        from: projectDetailNotifierProvider,
        name: r'projectDetailNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$projectDetailNotifierHash,
        dependencies: ProjectDetailNotifierFamily._dependencies,
        allTransitiveDependencies:
            ProjectDetailNotifierFamily._allTransitiveDependencies,
        id: id,
      );

  ProjectDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<ProjectEntity?> runNotifierBuild(
    covariant ProjectDetailNotifier notifier,
  ) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(ProjectDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProjectDetailNotifier, ProjectEntity?>
  createElement() {
    return _ProjectDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectDetailNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ProjectEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProjectDetailNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProjectDetailNotifier,
          ProjectEntity?
        >
    with ProjectDetailNotifierRef {
  _ProjectDetailNotifierProviderElement(super.provider);

  @override
  String get id => (origin as ProjectDetailNotifierProvider).id;
}

String _$projectNotifierHash() => r'a78d345ada59b443cb515f94014979544a4891d2';

/// See also [ProjectNotifier].
@ProviderFor(ProjectNotifier)
final projectNotifierProvider =
    AutoDisposeNotifierProvider<ProjectNotifier, ProjectState>.internal(
      ProjectNotifier.new,
      name: r'projectNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$projectNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProjectNotifier = AutoDisposeNotifier<ProjectState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
